## Tableau des objets du sac
sac <- c(25, 22, 14, 12, 9, 4)
## Trier les objets par ordre décroissant de taille.
sac <- sort(sac, decreasing = TRUE)

## Initialisation d'une sacoche vide
capacite <- sum(sac) %/% 2
sacoche <- numeric(0)

## Parcourir les objets du sac
for(objet in sac) {
    if(sum(sacoche) + objet <= capacite) {
        ## Placer l'objet dans la sacoche s'il reste assez de place
        sacoche <- c(sacoche, objet)

        if(sum(sacoche) == capacite) {
            ## Si la sacoche est pleine, arrêter l'algorithme.
            break
        }
    }
}

## Afficher le résultat
print(capacite)
print(sacoche)
