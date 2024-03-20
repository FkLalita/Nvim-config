local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
    'sudoerwx/vim-ray-so-beautiful',
    config = function()
      vim.g.ray_options = {
        theme = 'candy',
        background = 'true',
        darkMode = 'true',
        padding = '32',
        language = 'auto'
      }
    end
  }
  use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
  use({ 'nvim-treesitter/playground' })                                                                                       
  use({ 'theprimeagen/harpoon' })                                                                                             
  use({ 'mbbill/undotree' })                                                                                                  
  use({ 'tpope/vim-fugitive' })                                                                                               
  use({ 'jiangmiao/auto-pairs' })
  use({ "preservim/nerdtree" })
  use({ "ap/vim-css-color" })
  use({ 'Xuyuanp/nerdtree-git-plugin' })
  use({ "tpope/vim-surround" })
  use({ 'tpope/vim-commentary' })
  use({ 'airblade/vim-rooter' })
  use({ 'andrewradev/tagalong.vim' })
  use({ 'rust-lang/rust.vim' })
  use({ 'jbgutierrez/vim-better-comments' })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ 'nvim-lua/plenary.nvim' })
  use({ 'airblade/vim-gitgutter' })
  
  use { 'simrat39/rust-tools.nvim', requires = { 'neovim/nvim-lspconfig' } }
  use({ "iamcco/markdown-preview.nvim" })
  use({ "ThePrimeagen/vim-be-good" })
  use({ "mistricky/codesnap.nvim", run = "make" })


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
