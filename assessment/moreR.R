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

barplot(seq, main="Sequential Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 12))

sm0<-rowMeans(sequential_0_overall[,-1])
sm1<-rowMeans(sequential_1_overall[,-1])
sm2<-rowMeans(sequential_2_overall[,-1])
sm3<-rowMeans(sequential_3_overall[,-1])
sm4<-rowMeans(sequential_4_overall[,-1])
sm5<-rowMeans(sequential_5_overall[,-1])
sm5
seqO<-c(sm0,sm1,sm2,sm3,sm4,sm5)

barplot(seqO, main="Overall Sequential Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 120))
seqdat <- data.frame(x,seq)
seqOdat <- data.frame(x, seqO)

#######Default paralel##########

prm0<-rowMeans(parallel2_0[,-1])
pm0<-mean(prm0)
prm1<-rowMeans(parallel2_1[,-1])
pm1<-mean(prm1)
prm2<-rowMeans(parallel2_2[,-1])
pm2<-mean(prm2)
prm3<-rowMeans(parallel2_3[,-1])
pm3<-mean(prm3)
prm4<-rowMeans(parallel2_4[,-1])
pm4<-mean(prm4)
prm5<-rowMeans(parallel2_5[,-1])
pm5<-mean(prm5)
par<-c(pm0,pm1,pm2,pm3,pm4,pm5)
x<-c(0:5)

barplot(par, main="parallel Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 12))

psm0<-rowMeans(parallel2_0_overall[,-1])
psm1<-rowMeans(parallel2_1_overall[,-1])
psm2<-rowMeans(parallel2_2_overall[,-1])
psm3<-rowMeans(parallel2_3_overall[,-1])
psm4<-rowMeans(parallel2_4_overall[,-1])
psm5<-rowMeans(parallel2_5_overall[,-1])
parO<-c(psm0,psm1,psm2,psm3,psm4,psm5)

barplot(parO, main="Overall parallel Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 200))
pardat <- data.frame(x,par)
parOdat <- data.frame(x, parO)


#######100 paralel##########

p1rm0<-rowMeans(parallel100_0[,-1])
p1m0<-mean(p1rm0)
p1rm1<-rowMeans(parallel100_1[,-1])
p1m1<-mean(p1rm1)
p1rm2<-rowMeans(parallel100_2[,-1])
p1m2<-mean(p1rm2)
p1rm3<-rowMeans(parallel100_3[,-1])
p1m3<-mean(p1rm3)
p1rm4<-rowMeans(parallel100_4[,-1])
p1m4<-mean(p1rm4)
p1rm5<-rowMeans(parallel100_5[,-1])
p1m5<-mean(p1rm5)
par1<-c(p1m0,p1m1,p1m2,p1m3,p1m4,p1m5)
x<-c(0:5)

barplot(par1, main="100 Iterations Parallel Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 6))

p1sm0<-rowMeans(parallel100_0_overall[,-1])
p1sm1<-rowMeans(parallel100_1_overall[,-1])
p1sm2<-rowMeans(parallel100_2_overall[,-1])
p1sm3<-rowMeans(parallel100_3_overall[,-1])
p1sm4<-rowMeans(parallel100_4_overall[,-1])
p1sm5<-rowMeans(parallel100_5_overall[,-1])
parO1<-c(p1sm0,p1sm1,p1sm2,p1sm3,p1sm4,p1sm5)

barplot(parO1, main="Overall 100 Iteration Parallel Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 120))
par1dat <- data.frame(x,par1)
parO1dat <- data.frame(x, parO1)


#######static paralel##########

p2rm0<-rowMeans(parallel_static_0[,-1])
p2m0<-mean(p2rm0)
p2rm1<-rowMeans(parallel_static_1[,-1])
p2m1<-mean(p2rm1)
p2rm2<-rowMeans(parallel_static_2[,-1])
p2m2<-mean(p2rm2)
p2rm3<-rowMeans(parallel_static_3[,-1])
p2m3<-mean(p2rm3)
p2rm4<-rowMeans(parallel_static_4[,-1])
p2m4<-mean(p2rm4)
p2rm5<-rowMeans(parallel_static_5[,-1])
p2m5<-mean(p2rm5)
par2<-c(p2m0,p2m1,p2m2,p2m3,p2m4,p2m5)
x<-c(0:5)

barplot(par2, main="Parallel (Static) Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 14))

p2sm0<-rowMeans(parallel_static_0_overall[,-1])
p2sm1<-rowMeans(parallel_static_1_overall[,-1])
p2sm2<-rowMeans(parallel_static_2_overall[,-1])
p2sm3<-rowMeans(parallel_static_3_overall[,-1])
p2sm4<-rowMeans(parallel_static_4_overall[,-1])
p2sm5<-rowMeans(parallel_static_5_overall[,-1])
parO2<-c(p2sm0,p2sm1,p2sm2,p2sm3,p2sm4,p2sm5)

barplot(parO2, main="Overall Parallel (Static) Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 140))
par2dat <- data.frame(x,par2)
parO2dat <- data.frame(x, parO2)


#######dynamic paralel##########

p3rm0<-rowMeans(parallel_dynamic_0[,-1])
p3m0<-mean(p3rm0)
p3rm1<-rowMeans(parallel_dynamic_1[,-1])
p3m1<-mean(p3rm1)
p3rm2<-rowMeans(parallel_dynamic_2[,-1])
p3m2<-mean(p3rm2)
p3rm3<-rowMeans(parallel_dynamic_3[,-1])
p3m3<-mean(p3rm3)
p3rm4<-rowMeans(parallel_dynamic_4[,-1])
p3m4<-mean(p3rm4)
p3rm5<-rowMeans(parallel_dynamic_5[,-1])
p3m5<-mean(p3rm5)
par3<-c(p3m0,p3m1,p3m2,p3m3,p3m4,p3m5)
x<-c(0:5)

barplot(par3, main="Parallel (Dynamic) Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 14))

p3sm0<-rowMeans(parallel_dynamic_0_overall[,-1])
p3sm1<-rowMeans(parallel_dynamic_1_overall[,-1])
p3sm2<-rowMeans(parallel_dynamic_2_overall[,-1])
p3sm3<-rowMeans(parallel_dynamic_3_overall[,-1])
p3sm4<-rowMeans(parallel_dynamic_4_overall[,-1])
p3sm5<-rowMeans(parallel_dynamic_5_overall[,-1])
parO3<-c(p3sm0,p3sm1,p3sm2,p3sm3,p3sm4,p3sm5)

barplot(parO3, main="Overall Parallel (Dynamic) Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 140))
par3dat <- data.frame(x,par3)
parO3dat <- data.frame(x, parO3)

#######runtime paralel##########

p4rm0<-rowMeans(parallel_rt_0[,-1])
p4m0<-mean(p4rm0)
p4rm1<-rowMeans(parallel_rt_1[,-1])
p4m1<-mean(p4rm1)
p4rm2<-rowMeans(parallel_rt_2[,-1])
p4m2<-mean(p4rm2)
p4rm3<-rowMeans(parallel_rt_3[,-1])
p4m3<-mean(p4rm3)
p4rm4<-rowMeans(parallel_rt_4[,-1])
p4m4<-mean(p4rm4)
p4rm5<-rowMeans(parallel_rt_5[,-1])
p4m5<-mean(p4rm5)
par4<-c(p4m0,p4m1,p4m2,p4m3,p4m4,p4m5)
x<-c(0:5)

barplot(par4, main="Parallel (Dynamic) Time Per Block by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 14))

p4sm0<-rowMeans(parallel_rt_0_overall[,-1])
p4sm1<-rowMeans(parallel_rt_1_overall[,-1])
p4sm2<-rowMeans(parallel_rt_2_overall[,-1])
p4sm3<-rowMeans(parallel_rt_3_overall[,-1])
p4sm4<-rowMeans(parallel_rt_4_overall[,-1])
p4sm5<-rowMeans(parallel_rt_5_overall[,-1])
parO4<-c(p4sm0,p4sm1,p4sm2,p4sm3,p4sm4,p4sm5)

barplot(parO4, main="Overall Parallel (Dynamic) Time by Difficulty", 
        xlab="Difficulty", ylab="Time(s)", names.arg =x, ylim = c(0, 140))
par4dat <- data.frame(x,par3)
parO4dat <- data.frame(x, parO3)


#per block

df<- merge(seqdat, pardat, by.x="x", by.y="x")
df <- merge(df, par1dat, by.x="x", by.y="x")
df <- merge(df, par2dat, by.x="x", by.y="x")
df <- merge(df, par3dat, by.x="x", by.y="x")
df <- merge(df, par4dat, by.x="x", by.y="x")
df

ggplot(df) + 
  geom_point(aes(x=x, y=seq, color="Sequential")) +
  geom_point(aes(x=x, y=par, color="paralell")) + 
  geom_point(aes(x=x, y=par1, color="paralell 100")) +
  geom_point(aes(x=x, y=par2, color="paralell static")) +
  geom_point(aes(x=x, y=par3, color="paralell dynamic")) +
  geom_point(aes(x=x, y=par4, color="paralell runtime")) +
  ggtitle("Parallel and Sequential time per block") + 
  xlab("Difficulty") +
  ylab("Time(s)")

#overall time

df<- merge(seqOdat, parOdat, by.x="x", by.y="x")
df <- merge(df, parO1dat, by.x="x", by.y="x")
df <- merge(df, parO2dat, by.x="x", by.y="x")
df <- merge(df, parO3dat, by.x="x", by.y="x")
df <- merge(df, parO4dat, by.x="x", by.y="x")
df

ggplot(df) + 
  geom_point(aes(x=x, y=seqO, color="Sequential")) +
  geom_point(aes(x=x, y=parO, color="paralell")) + 
  geom_point(aes(x=x, y=parO1, color="paralell 100")) +
  geom_point(aes(x=x, y=parO2, color="paralell static")) +
  geom_point(aes(x=x, y=parO3, color="paralell dynamic")) +
  geom_point(aes(x=x, y=parO4, color="paralell runtime")) +
  ggtitle("Parallel and Sequential time overall") + 
  xlab("Difficulty") +
  ylab("Time(s)")

su <- m5/pm5
su
eff = su/6
eff 

su <- m5/p1m5
su
eff = su/6
eff 

su <- m5/p2m5
su
eff = su/6
eff 

su <- m5/p3m5
su
eff = su/6
eff 

su <- m5/p4m5
su
eff = su/6
eff

su <- sm5/p4sm5
su
eff <- su/6
eff
