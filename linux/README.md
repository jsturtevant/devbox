# Linux

## Quick setup

```bash
curl https://raw.githubusercontent.com/jsturtevant/devbox/master/linux/init.sh | sudo bash
```

## ssh keys

Keys are stored in key vault use:

Save one: `az keyvault secret set --vault-name <vault-name>  -n idrsa -f ~/.ssh/id_rsa`

Get one: `az keyvault secret download --vault-name <vault-name> -n idrsa -f ~/.ssh/id_rsa`


If on WSL  run `terminals/windows/Setup-Console.ps1` to set up fonts and set font on the terminal.
