library(data.table)
library(Gviz)

# Specifiy the range to plot
thechr <- "chrX"
st <- 77501662
en <- 77786233

# creating reference track
ref <- GRanges('chrX', IRanges(77501662, 77786233))
ref_track <- GenomeAxisTrack(ref, lwd=1000, fontsize=5)

itrack <- IdeogramTrack(genome = "hg19", chromosome = thechr)

# reading your data
data <- read.table("match-ex.bed", sep = "\t", header = TRUE)
data[is.na(data)] <- 0

# creating Granges object for your data
gr2 <- as(data, "GRanges")
gr2


# creating dataTrack and plotting tracks
data_track.stacked <-GeneRegionTrack(gr2, name = "String Tie Trancripts", chromosome = "chrX",width = 0.1,
                                     transcriptAnnotation = "transcript",
                                     stacking = "squish",
                                     featureAnnotation = "id",
                                     fontcolor.feature  =  "blue", 
                                     fontsize.feature = 6, 
                                     fill = "brown",
                                     size = 0.1,
                                     cex.id = 5,
                                     background.panel = "#FFFEDB",
                                     background.title = "#40464C",
                                     genome = "hg19", 
                                     showFeatureId = T, 
                                     min.height=1)



plotTracks(list(itrack,gtrack,data_track.stacked),shape = "box",sizes = c(0.1, 0.2, 5))
