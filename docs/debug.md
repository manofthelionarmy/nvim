## Debugging

Dap will help us debug our applications. It supports both nvim lsp and coc-nvim. It may support more
autocompletion plugins, but we'll be focusing primarily on coc-nvim.

The only debuggers I have configured are for javascript. Vim-go has debugging support out of the box 🐐.

According to the documentation, we must install a debugger manually.

The ones I have installed are:

```
vscode-firefox-debug   " I have manjaro and ubuntu, so firefox is the default browser.
vscode-node-debug2     " I want this debugger for javascript, vim-go comes with debugging out of the box :)
```
<b>Disclaimer!!!</b> the documentation is not clear, and this threw off a beginner like me:

<em>The configuration is dependentent on filetype </em>

Ex:

```
dap.configurations.javascript = {
  debug_with_firefox,
  debug_with_node_launch,
  debug_with_node_attach,
}
```
This will set the debugger for `dap.configurations[filetype]`
Meaning, if we have our filetype set to javascript, dap will load this configuration.

### Install debuggers

We'll install them in `~/.config/dap_adapaters`.
Clone the adapters from their git repos and run npm install.
We must build the debuggers after we install the modules.

TODO: double check in the docs
For `vscode-node-debug2`, run:

```
./node_modules/.bin/gulp .
```

For  `vscode-firefox-debug` , run npm run build
