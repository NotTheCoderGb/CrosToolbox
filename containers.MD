Enable nested containers
1.1- Close the Linux environment, if it is already active.

1.2- Open a Chrome browser, then press Ctrl-Alt-T

1.3- In the crosh tab that will open, use these commands to enable nested containers:
       vmc start termina
       lxc config set penguin security.nesting true
       exit
       vmc stop termina
    