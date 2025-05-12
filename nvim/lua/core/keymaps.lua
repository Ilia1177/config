-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set
keymap("n", "<leader>n", ":NorminetteEnable<CR>", { desc = "Run Norminette" })
-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- J déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-j>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
keymap("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre droite" })

-- Telescope --
keymap(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de fichiers" }
)
keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { desc = "Recherche de chaînes de caractères dans le contenu des fichiers" }
)
keymap(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de buffers" }
)
keymap(
  "n",
  "<leader>fx",
  "<cmd>Telescope grep_string<cr>",
  { desc = "Recherche de la chaîne de caractères sous le curseur" }
)
