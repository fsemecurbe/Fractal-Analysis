setwd('C:/Users/francois.semecurbe/Desktop/temp/these/Fractal-Analysis-main')
load('coord_pt_proxy.Rdata')
library(dplyr)

library(sf)
library(btb)
data(pixel_france_1km_2154)

df = pt_proxy[,c('x', 'y', 'M_50', 'M_100', 'M_200', 'M_400', 'M_800')]
df[,c('M_50', 'M_100', 'M_200', 'M_400', 'M_800')] = 1 / df[,c('M_50', 'M_100', 'M_200', 'M_400', 'M_800')] 

liss = kernelSmoothing(df, sEPSG = '2154', iCellSize = 1000, dfCentroids = pixel_france, iBandwidth = 8000)

st_write(liss, 'lissage.shp')
