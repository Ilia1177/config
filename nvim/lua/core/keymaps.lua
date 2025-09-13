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
keymap("v", "<M-k>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<M-j>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })
-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

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

keymap(
	"n", 
	"<leader>tw", 
	function() vim.wo.wrap = not vim.wo.wrap end, 
	{ desc = "Toggle line wrap" }
)

local term_buf = nil
local term_win = nil

local function toggle_bottom_terminal()
  -- If terminal window is open, close it (keep the buffer so the shell session persists)
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- If there is an existing terminal buffer (session), reuse it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd("botright split | resize 10")
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, term_buf)
    term_win = win
    vim.cmd("startinsert")
    return
  end

  -- Otherwise create a new bottom terminal
  vim.cmd("botright split | resize 10 | terminal")
  term_win = vim.api.nvim_get_current_win()
  term_buf = vim.api.nvim_get_current_buf()
  vim.cmd("startinsert")

  -- Cleanup vars if the terminal buffer is wiped/closed or job exits
  vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete", "TermClose" }, {
    buffer = term_buf,
    once = true,
    callback = function()
      term_buf = nil
      term_win = nil
    end,
  })
end

keymap(
  "n",
  "<leader>t",
  toggle_bottom_terminal,
  { desc = "Toggle bottom terminal" }
)

keymap(
  "t",
  "<leader>t",
  toggle_bottom_terminal,
  { desc = "Toggle bottom terminal (from terminal-mode)" }
)
