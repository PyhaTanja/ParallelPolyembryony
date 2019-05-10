args <- commandArgs(trailingOnly = TRUE)
fitness.effects1	<-args[1]
dom.effects1	<-args[2]
U1	<-args[3]
dist.timing1  <- args[4]
selfing.rate1 <-args[5]
iteration <-args[6]

print(paste0("Fitness effects ",fitness.effects1 ))
print(paste0("dom.effects ", dom.effects1))
print(paste0("Mutation ", U1))
print(paste0("dist.timing ", dist.timing1))
print(paste0("selfing.rate ", selfing.rate1))

source("/proj/project_2000325/Polyembryony/polyembryonyEvolution.R")
source("/proj/project_2000325/Polyembryony/processPoly.R")

z <-runSim(n.gen = 2000, U=as.numeric(U1), selfing.rate=as.numeric(selfing.rate1), fitness.effects = as.numeric(fitness.effects1), dom.effects = as.numeric(dom.effects1), introduce.polyem = Inf, dist.timing = as.numeric(dist.timing1), just.return.genomes = FALSE)

uniqs = numUnique(z)
pdf(file=paste("NumUnique_w", fitness.effects1, "_h",dom.effects1,"_U",U1,"_t",dist.timing1,"_S",selfing.rate1,"_i",iteration, ".pdf", sep=""))
	plot(uniqs$gen, uniqs$n_unique_muts)
dev.off()

save(z,file=paste ("BurninGenome_w", fitness.effects1, "_h",dom.effects1,"_U",U1,"_t",dist.timing1,"_S",selfing.rate1,"_i",iteration, sep=""))
