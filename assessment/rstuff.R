install.packages("ggplot2")

library("ggplot2")

rm0<-rowMeans(sequential_0[,-1])
m0<-mean(rm0)
rm1<-rowMeans(sequential_1[,-1])
m1<-mean(rm1)
rm2<-rowMeans(sequential_2[,-1])
m2<-mean(rm2)
rm3<-rowMeans(sequential_3[,-1])
m3<-mean(rm3)
rm4<-rowMeans(sequential_4[,-1])
m4<-mean(rm4)
rm5<-rowMeans(sequential_5[,-1])
m5<-mean(rm5)
seq<-c(m0,m1,m2,m3,m4,m5)
x<-c(0:5)
for(i in 0:5)
{
  heading = paste("Sequential Time by difficulty")
  plot(x, seq, type="n", main=heading, xlab="Difficulty", ylab = "Time(s)")
  lines(x, seq, type="b")
}

barplot(seq, main="Sequential Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 12))

qplot(x, seq, geom="line", main="Sequential Time Difficulty", 
      xlab="Difficulty", ylab="Time(s)")

sm0<-rowMeans(sequential_0_overall[,-1])
sm1<-rowMeans(sequential_1_overall[,-1])
sm2<-rowMeans(sequential_2_overall[,-1])
sm3<-rowMeans(sequential_3_overall[,-1])
sm4<-rowMeans(sequential_4_overall[,-1])
sm5<-rowMeans(sequential_5_overall[,-1])
sm5
seqO<-c(sm0,sm1,sm2,sm3,sm4,sm5)
x<-c(0:5)
for(i in 0:5)
{
  heading = paste("Sequential Time by difficulty")
  plot(x, seqO, type="n", main=heading, xlab="Difficulty", ylab = "Time(s)")
  lines(x, seqO, type="b")
}

barplot(seqO, main="Overall Sequential Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 120))

qplot(x, seqO, geom="line", main="Sequential Time Difficulty", 
      xlab="Difficulty", ylab="Time(s)")

seqdat <- data.frame(x,seq)
seqOdat <- data.frame(x, seqO)

#PARALELL FOR
pm0<-rowMeans(parallel_0_overall[,-1])
pm1<-rowMeans(parallel_1_overall[,-1])
pm2<-rowMeans(parallel_2_overall[,-1])
pm3<-rowMeans(parallel_3_overall[,-1])
pm4<-rowMeans(parallel_4_overall[,-1])
pm5<-rowMeans(parallel_5_overall[,-1])
pm5
parO<-c(pm0,pm1,pm2,pm3,pm4,pm5)
x<-c(0:5)
for(i in 0:5)
{
  heading = paste("Default Parallel For by difficulty")
  plot(x, par, type="n", main=heading, xlab="Difficulty", ylab = "Time(s)")
  lines(x, par, type="b")
}

barplot(par, main="Default Parallel For by difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 250))

pardat<-data.frame(x, parO)
df<- merge(seqOdat, pardat, by.x="x", by.y="x")
df

plot<-ggplot(df) + 
  geom_point(aes(x=x, y=seqO, color="Sequential")) +
  geom_point(aes(x=x, y=parO, color="paralell")) + 
  ggtitle("Parallel For and Sequential") + 
  xlab("Difficulty") +
  ylab("Time(s)")
plot

prm0<-rowMeans(parallel_0[,-1])
pm0<-mean(prm0)
prm1<-rowMeans(parallel_1[,-1])
pm1<-mean(prm1)
prm2<-rowMeans(parallel_2[,-1])
pm2<-mean(prm2)
prm3<-rowMeans(parallel_3[,-1])
pm3<-mean(prm3)
prm4<-rowMeans(parallel_4[,-1])
pm4<-mean(prm4)
prm5<-rowMeans(parallel_5[,-1])
pm5<-mean(prm5)
par<-c(pm0,pm1,pm2,pm3,pm4,pm5)

barplot(par, main="Default Parallel For by difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 12))

pardat<-data.frame(x, par)
df<- merge(seqdat, pardat, by.x="x", by.y="x")
df

plot<-ggplot(df) + 
  geom_point(aes(x=x, y=seq, color="Sequential")) +
  geom_point(aes(x=x, y=par, color="paralell")) + 
  ggtitle("Parallel For and Sequential time per block") + 
  xlab("Difficulty") +
  ylab("Time(s)")
plot


su <- sm5/pm5
su
eff = su/6
eff