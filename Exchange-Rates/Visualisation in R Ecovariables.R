eurofxref.hist <- read.csv("C:/Users/PC-CATHERINE/Downloads/eurofxref-hist/eurofxref-hist.csv")
#View(eurofxref.hist)


exchange_rate_euro <- read.csv("C:/Users/PC-CATHERINE/Downloads/eurofxref-hist/eurofxref-hist.csv", stringsAsFactors=FALSE)
exchange_rate_euro <- exchange_rate_euro[,c(1:42)]
exchange_rate_euro[,c(2:42)] <- lapply(exchange_rate_euro[,c(2:42)],as.numeric)
exchange_rate_euro[is.na(exchange_rate_euro)] = 0
exchange_rate_euro[,1] <- as.Date(exchange_rate_euro[,1], "%Y-%m-%d")
df <- melt(exchange_rate_euro, id = c("Date")) 


plot<-df%>% 
  ggplot(aes(x=Date,y=`Exchange rate of hryvnia, UAH for 1 unit`,color=Currency))+
  geom_line(alpha=0.8)

plot






plot<-df%>% ggplot(aes(x=Date,y=`value`,color=variable))+ geom_line(alpha=0.8)+ geom_point(size=2)

plot<-df%>%
  ggplot(aes(x=Date,y=`value`,color=variable))+
  geom_line(alpha=0.8)+
  geom_point(size=2)+
  theme_solarized_2(light=F)+
  labs(title="THE EXCHANGE RATE OF CURRENCIES VS EURO",
       caption="Source: EUROPEAN CENTRAL BANK")+
  theme(text=element_text(colour="yellow"),
        title=element_text(size=8,face = "bold"),
        plot.title=element_text(hjust=0.5),
        axis.title.x = element_blank(),
        panel.grid.minor.x=element_blank(),
        legend.background = element_blank(),
        legend.key= element_blank(),
        legend.position=c(0.095, 0.81),# legend at top-left, inside the plot
        plot.margin = unit(c(0.5,1.3,0.5,0.5), "cm"))+ 
  scale_x_date(date_labels = "%b",date_breaks  ="1 month")


plot.animation=plot+
  transition_reveal(Date)+
  view_follow(fixed_y=T)

animate(plot.animation, height=420,width=700,fps=30,duration=10,end_pause = 120,res=100,rewind=F)
anim_save("THE OFFICIAL EXCHANGE RATE OF THE HRYVNIA TO FOREIGN CURRENCIES.gif")