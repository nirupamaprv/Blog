#Load Packages
install.packages('ggplot2')
library(ggplot2)


setwd('//Users/nirupamaprv/Documents/nimmu/')
getwd()

#Read Blog details from csv
blogInfo <- read.csv('WPCount.csv')
View(blogInfo)

#Make graph of Images vs Likes
ggplot(data = blogInfo)+
  geom_line(mapping = aes(x = ImageCount, y = Likes))+
  geom_point(mapping = aes(x = ImageCount, y = Likes), color = 'blue')

#calculate social proof as #Likes+ #Comments
img <- blogInfo$ImageCount
blogInfo$social <- blogInfo$Likes + blogInfo$Comments
s_info <- blogInfo$social

#compute correlation between image count and social proof
cor.test(img, s_info)
cor.test(img, s_info, method = 'kendall')
cor.test(img, s_info, mmethod = 'spearman')
cor.test(img, s_info, method = 'pearson')

#plot image count vs social proof
ggplot(data = blogInfo)+
  geom_line(mapping = aes(x = ImageCount, y = s_info))+
  geom_point(mapping = aes(x = ImageCount, y = s_info), color = 'blue')

#use shape attribute for monthwise depiction
ggplot(data = blogInfo)+
  geom_line(mapping = aes(x = ImageCount, y = s_info))+
  geom_point(mapping = aes(x = ImageCount, y = s_info, shape = Year), color = 'red')


#use color attribute for monthwise depiction
ggplot(data = blogInfo)+
  geom_line(mapping = aes(x = ImageCount, y = s_info))+
  geom_point(mapping = aes(x = ImageCount, y = s_info, color = Year))
