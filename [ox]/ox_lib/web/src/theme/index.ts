import { MantineThemeOverride, Paper } from '@mantine/core';

export const theme: MantineThemeOverride = {
  colorScheme: 'dark',
  fontFamily: 'Saira',
  shadows: { 
    md: 'inset 0px 0px 40px 10px rgba(16,16,18,1)',
    sm: 'inset 0px 0px 40px 5px rgba(43, 6, 12, 0.336)',
  },
  radius: { xs: 6, sm: 6, md: 6, lg: 20, xl: 50 },
  components: {
    Button: {
      styles: {
        root: {
          border: 'none',
        },
      },
    },
    Modal: {
      styles: {
        modal: {
          backgroundColor: 'rgba(0, 0, 0, 0.7)',
          color: 'white',
        },
        root: {
          color: 'white',
        },
        title: {
          color: 'white',
        },
      },
    },
  },
};
