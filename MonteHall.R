#
# Monte Hall Simulation
# 27 Nov '18

trials <- 1000000

doors <- sample(1:3, trials, replace = T)
initSel <- sample(1:3, trials, replace = T)

noSwitchCount <- 0
switchCount <- 0
for (i in 1:trials) {
  if (initSel[i] == doors[i]) { # Player never switches doors
    noSwitchCount = noSwitchCount + 1
  } else {
    switchCount = switchCount + 1            # Player always switch
  }
}

print(noSwitchCount/trials)
print(switchCount/trials)
