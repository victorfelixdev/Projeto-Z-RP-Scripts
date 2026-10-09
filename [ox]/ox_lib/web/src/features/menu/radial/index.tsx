import { Box, createStyles } from '@mantine/core';
import { useEffect, useState } from 'react';
import { IconProp } from '@fortawesome/fontawesome-svg-core';
import { useNuiEvent } from '../../../hooks/useNuiEvent';
import { fetchNui } from '../../../utils/fetchNui';
import { isIconUrl } from '../../../utils/isIconUrl';
import ScaleFade from '../../../transitions/ScaleFade';
import type { RadialMenuItem } from '../../../typings';
import { useLocales } from '../../../providers/LocaleProvider';
import LibIcon from '../../../components/LibIcon';

const MENU_SIZE = 350;
const OUTER_RADIUS = 175;
const CENTER_RADIUS = 85;
const INNER_RADIUS = CENTER_RADIUS + 10;
const SECTOR_GAP = 2;
const PAGE_ITEMS = 8;

const useStyles = createStyles((theme) => ({
  wrapper: {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
  },
  sector: {
    fill: '#1a1d21cc',
    color: theme.colors.dark[0],
    transition: 'all 0.2s cubic-bezier(0.4, 0, 0.2, 1)',
    stroke: 'transparent',
    cursor: 'pointer',
    strokeWidth: 5,
    boxShadow: theme.shadows.xl,
    '&:hover': {
      fill: '#121212d9',
      stroke: '#ff004054',
      strokeWidth: 2,
      strokeDasharray: 2,
      '& g > svg > path': {
        fill: '#ffffff',
      },
    },
    '&[data-selected="true"]': {
      fill: 'rgba(12, 12, 12, 0.9)',
      stroke: '#ff004054',
      strokeWidth: 2,
    },
  },
  backgroundCircle: {
    fill: '#1a1d2100',
  },
  centerCircle: {
    fill: '#1a1d2188',
    stroke: 'ff004054',
    strokeWidth: 2,
    strokeDasharray: 2,
    pointerEvents: 'auto',
    cursor: 'pointer',
    transition: 'all 0.2s cubic-bezier(0.4, 0, 0.2, 1)',
    '&:hover': {
      fill: '#121212a1',
      stroke: '#ff004054',
      strokeWidth: '1px',
    },
  },
  centerIconContainer: {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    pointerEvents: 'none',
  },
  centerIcon: {
    color: 'rgba(255, 255, 255, 0.9)',
    opacity: 0.9,
  },
  closeIcon: {
    color: 'rgba(255, 255, 255, 0.9)',
    opacity: 0.9,
    background: 'none',
    pointerEvents: 'none',
    transform: 'rotate(-90deg)',
  },
}));

const calculateFontSize = (text: string): number => {
  if (text.length > 20) return 10;
  if (text.length > 15) return 12;
  return 13;
};

const splitTextIntoLines = (text: string, maxCharPerLine: number = 15): string[] => {
  const words = text.split(' ');
  const lines: string[] = [];
  let currentLine = words[0];

  for (let i = 1; i < words.length; i++) {
    if (currentLine.length + words[i].length + 1 <= maxCharPerLine) {
      currentLine += ' ' + words[i];
    } else {
      lines.push(currentLine);
      currentLine = words[i];
    }
  }
  lines.push(currentLine);
  return lines;
};


const degToRad = (deg: number) => deg * (Math.PI / 180);

const createSectorPath = (
  centerX: number,
  centerY: number,
  radius: number,
  innerRadius: number,
  startAngle: number,
  endAngle: number
): string => {
  const startRadians = degToRad(startAngle);
  const endRadians = degToRad(endAngle);

  const startX = centerX + Math.cos(startRadians) * radius;
  const startY = centerY + Math.sin(startRadians) * radius;
  const endX = centerX + Math.cos(endRadians) * radius;
  const endY = centerY + Math.sin(endRadians) * radius;

  const innerStartX = centerX + Math.cos(startRadians) * innerRadius;
  const innerStartY = centerY + Math.sin(startRadians) * innerRadius;
  const innerEndX = centerX + Math.cos(endRadians) * innerRadius;
  const innerEndY = centerY + Math.sin(endRadians) * innerRadius;

  const largeArcFlag = endAngle - startAngle > 180 ? 1 : 0;

  return `
    M ${startX} ${startY}
    A ${radius} ${radius} 0 ${largeArcFlag} 1 ${endX} ${endY}
    L ${innerEndX} ${innerEndY}
    A ${innerRadius} ${innerRadius} 0 ${largeArcFlag} 0 ${innerStartX} ${innerStartY}
    Z
  `.trim();
};

const RadialMenu: React.FC = () => {
  const { classes } = useStyles();
  const { locale } = useLocales();
  const newDimension = 350 * 1.1025;
  const [visible, setVisible] = useState(false);
  const [menuItems, setMenuItems] = useState<RadialMenuItem[]>([]);
  const [selectedSector, setSelectedSector] = useState<number | null>(null);
  const [isCloseHovered, setIsCloseHovered] = useState(false);
  const [menu, setMenu] = useState<{ items: RadialMenuItem[]; sub?: boolean; page: number }>({
    items: [],
    sub: false,
    page: 1,
  });

  const [currentSector, setCurrentSector] = useState<RadialMenuItem>();

  const changePage = async (increment?: boolean) => {
    setVisible(false);
    setSelectedSector(null);
    const didTransition: boolean = await fetchNui('radialTransition');
    if (!didTransition) return;
    setVisible(true);
    setMenu({ ...menu, page: increment ? menu.page + 1 : menu.page - 1 });
  };

  const handleClose = async () => {
    try {
      setVisible(false);
      setSelectedSector(null);
      const response = await fetchNui('radialClose');
      if (!response || !response.success) {
        console.warn("NUI closeRadial event not processed, using fallback.");
      }
      await fetchNui('hideCursor');
    } catch (error) {
      // console.error("Error closing radial menu:", error);
    }
  };

  useEffect(() => {
    if (menu.items.length <= PAGE_ITEMS) return setMenuItems(menu.items);

    const items = menu.items.slice(
      PAGE_ITEMS * (menu.page - 1) - (menu.page - 1),
      PAGE_ITEMS * menu.page - menu.page + 1
    );

    if (PAGE_ITEMS * menu.page - menu.page + 1 < menu.items.length) {
      items[items.length - 1] = { icon: 'ellipsis-h', label: locale.ui.more, isMore: true };
    }

    setMenuItems(items);
  }, [menu.items, menu.page]);

  useNuiEvent('openRadialMenu', async (data: { items: RadialMenuItem[]; sub?: boolean; option?: string } | false) => {
    if (!data) {
      setVisible(false);
      setSelectedSector(null);
      return;
    }
    let initialPage = 1;
    if (data.option) {
      data.items.findIndex(
        (item, index) => item.menu === data.option && (initialPage = Math.floor(index / PAGE_ITEMS) + 1)
      );
    }
    setMenu({ ...data, page: initialPage });
    setVisible(true);
  });

  useNuiEvent('refreshItems', (data: RadialMenuItem[]) => {
    setMenu({ ...menu, items: data });
  });

  return (
    <Box
      className={classes.wrapper}
      onContextMenu={async (e) => {
        e.preventDefault();
        if (menu.page > 1) await changePage();
        else if (menu.sub) fetchNui('radialBack');
      }}
    >
      <ScaleFade visible={visible}>
        <svg width={`${MENU_SIZE}px`} height={`${MENU_SIZE}px`} transform="rotate(90)">
        <defs>
          <radialGradient id="insetShadow" cx="50%" cy="50%" r="50%">
            <stop offset="70%" stopColor="rgba(77,16,29,0.0)" />
            <stop offset="100%" stopColor="rgba(77,16,29,0.77)" />
          </radialGradient>
          <filter id="inset-shadow" x="-50%" y="-50%" width="200%" height="200%">
          <radialGradient id="sectorInsetGradient" cx="50%" cy="50%" r="50%">
            <stop offset="70%" stopColor="rgba(77,16,29,0.0)" />
            <stop offset="100%" stopColor="rgba(77,16,29,0.77)" />
          </radialGradient>
            <feComponentTransfer in="SourceAlpha">
              <feFuncA type="table" tableValues="1 0" />
            </feComponentTransfer>
            <feGaussianBlur stdDeviation="4" result="blur" />
            <feOffset dx="0" dy="0" />
            <feComposite in2="SourceAlpha" operator="arithmetic" k2="-1" k3="1" result="inset-shadow" />
            <feMerge>
              <feMergeNode in="inset-shadow" />
              <feMergeNode in="SourceGraphic" />
            </feMerge>
          </filter>
        </defs>
        <g transform={`translate(${MENU_SIZE / 2}, ${MENU_SIZE / 2})`} onClick={handleClose}>
          {/* fundo com sombra inset */}
          <circle r={CENTER_RADIUS} fill="url(#insetShadow)" />
          {/* botão real */}
          <circle r={CENTER_RADIUS - 2} className={classes.centerCircle} />
        </g>
          {menuItems.map((item, index) => {
            const totalSectors = menuItems.length < 3 ? 3 : menuItems.length;
            const pieAngle = 360 / totalSectors;
            const startAngle = index * pieAngle;
            const endAngle = startAngle + pieAngle;

            const angle = degToRad((startAngle + endAngle) / 2);
            const radius = (OUTER_RADIUS + INNER_RADIUS) / 2 - SECTOR_GAP;
            const iconX = MENU_SIZE / 2 + Math.cos(angle) * radius;
            const iconY = MENU_SIZE / 2 + Math.sin(angle) * radius;
            const iconWidth = Math.min(Math.max(item.iconWidth || 50, 0), 100);
            const iconHeight = Math.min(Math.max(item.iconHeight || 50, 0), 100);

            const clickIndex = menu.page === 1 ? index : PAGE_ITEMS * (menu.page - 1) - (menu.page - 1) + index;

            return (
              <g
                key={`${item.label}-${index}`}
                className={classes.sector}
                data-selected={selectedSector === clickIndex}
                onClick={async () => {
                  if (!item.isMore) {
                    setSelectedSector(clickIndex);
                    fetchNui('radialClick', clickIndex);
                  } else {
                    await changePage(true);
                  }
                }}
                onMouseEnter={() => setCurrentSector(item)}
                onMouseLeave={() => setCurrentSector(undefined)}
              >
                <path
                  d={createSectorPath(
                    MENU_SIZE / 2,
                    MENU_SIZE / 2,
                    OUTER_RADIUS - SECTOR_GAP,
                    INNER_RADIUS,
                    startAngle,
                    endAngle
                  )}
                  filter="url(#inset-shadow)"
                />
                <g transform={`translate(${iconX}, ${iconY}) rotate(-90)`} pointerEvents="none">
                  {typeof item.icon === 'string' && isIconUrl(item.icon) ? (
                    <image
                      href={item.icon}
                      width={iconWidth}
                      height={iconHeight}
                      x={-iconWidth / 2}
                      y={-iconHeight / 2}
                    />
                  ) : (
                    <LibIcon
                      x={-11.5}
                      y={-11.5}
                      icon={item.icon as IconProp}
                      width={25}
                      height={25}
                      fixedWidth
                    />
                  )}
                </g>
              </g>
            );
          })}
          <g
            transform={`translate(${MENU_SIZE / 2}, ${MENU_SIZE / 2})`}
            onClick={handleClose}
            onMouseEnter={() => setIsCloseHovered(true)}
            onMouseLeave={() => setIsCloseHovered(false)}
          >
            <circle r={CENTER_RADIUS} className={classes.centerCircle} />
            {isCloseHovered && (
              <g transform="translate(-12.5, -12.5)">
                <LibIcon
                  x={0}
                  y={0}
                  icon="times"
                  width={25}
                  height={25}
                  className={classes.closeIcon}
                  fixedWidth
                />
              </g>
            )}
          </g>
        </svg>
        <div className={classes.centerIconContainer}>
          {currentSector && !isCloseHovered && (
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                justifyContent: "center",
                alignItems: "center",
                textAlign: "center",
                gap: 6,
                padding: '0.4rem',
                background: 'none',
                borderRadius: '4px',
                boxShadow: 'none',
                maxWidth: '160px',
              }}
            >
              <LibIcon
                className={classes.centerIcon}
                icon={currentSector.icon as IconProp}
                width={80}
                height={80}
                fixedWidth
                size='2x'
              />
              <span
                style={{
                  color: 'rgba(255, 255, 255, 0.9)',
                  fontSize: '13px',
                  fontWeight: 500,
                  opacity: 0.9,
                  textShadow: '0 1px 2px rgba(0,0,0,0.2)',
                }}
              >
                {currentSector.label.includes('  \n')
                  ? currentSector.label.split('  \n').map((value) => (
                      <span key={value} style={{ display: 'block', marginTop: '0.3em' }}>
                        {value}
                      </span>
                    ))
                  : currentSector.label}
              </span>
            </div>
          )}
        </div>
      </ScaleFade>
    </Box>
  );
};

export default RadialMenu;
