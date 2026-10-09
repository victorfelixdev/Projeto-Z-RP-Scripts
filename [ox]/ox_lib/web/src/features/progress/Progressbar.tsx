import React from 'react';
import { Box, createStyles, Text } from '@mantine/core';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { fetchNui } from '../../utils/fetchNui';
import ScaleFadeLazy from '../../transitions/ScaleFadeLazy';
import type { ProgressbarProps } from '../../typings';
import SlideUp from '../../transitions/SlideUp';


const useStyles = createStyles((theme) => ({
  background: {
    width: '100%',
    height: '100vh',
    background: `radial-gradient(ellipse at bottom, ${theme.colors[theme.primaryColor][theme.fn.primaryShade()]} 0%, transparent 20%)`,
  },
  container: {
    width: 350,
    height: 15,
    borderRadius: theme.radius.sm,
    backgroundColor: 'rgba(0, 0, 0, 0.7)',
    overflow: 'hidden',
    transition: 'all 1.5s transform ease',
    boxShadow: `0px 100vh 200vh 100vh rgba(0, 0, 0, 0.5)`,
    display: 'flex',
    alignItems: 'center',
    padding: '0 5px'
  },
  wrapper: {
    width: '100%',
    height: '20%',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    bottom: 0,
    position: 'absolute',
    // backgroundColor: 'rgba(022, 022, 022, 0.8)',
  },
  image: {
    width: '100px',
    height: '100px',
    position: 'absolute',
    top: '-20px',
    right: '-40px',
    filter: 'grayscale(50%)',
    opacity: '0.7',
    ZIndex: '1'
  },
  bar: {
    height: 5,
    backgroundColor: '#70030f',
    borderRadius: 2,
  },
  labelWrapper: {
    position: 'absolute',
    display: 'flex',
    width: 350,
    height: 70,
    alignItems: 'center',
    justifyContent: 'center',
  },
  label: {
    maxWidth: 350,
    padding: 8,
    textOverflow: 'ellipsis',
    overflow: 'hidden',
    whiteSpace: 'nowrap',
    fontSize: 20,
    color: "#fff",
    textShadow: `0px 0px 5px rgba(255, 255, 255, 1)`,
  },
}));

const Progressbar: React.FC = () => {
  const { classes } = useStyles();
  const [visible, setVisible] = React.useState(false);
  const [label, setLabel] = React.useState('');
  const [duration, setDuration] = React.useState(0);

  const imageUrl: string = `https://r2.fivemanage.com/eDNfSbRnSjj8gM1s5q4Wt/image/xkNY98T.png`

  useNuiEvent('progressCancel', () => setVisible(false));

  useNuiEvent<ProgressbarProps>('progress', (data) => {
    setVisible(true);
    setLabel(data.label);
    setDuration(data.duration);
  });

  return (
    <>
    {/* <SlideUp visible={visible}>
      <Box
        className={classes.background}
        opacity={0.6}
        style={{
        }}
      />
    </SlideUp> */}
      <Box className={classes.wrapper}>
        <SlideUp visible={visible} onExitComplete={() => fetchNui('progressComplete')}>

          <Box className={classes.container}>
            <img src={imageUrl} className={classes.image} alt="Progress Bar Icon" />
            <Box
              className={classes.bar}
              onAnimationEnd={() => setVisible(false)}
              sx={{
                animation: 'progress-bar linear',
                animationDuration: `${duration}ms`,
              }}
            >
              <Box className={classes.labelWrapper}>
                <Text className={classes.label}>{label}</Text>
              </Box>
            </Box>
          </Box>
        </SlideUp>
      </Box>
    </>
  );
};

export default Progressbar;
