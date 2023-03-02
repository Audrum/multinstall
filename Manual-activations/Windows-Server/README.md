# Windows Server

* [Convert to retail or datacenter edition]()
* [Activate]()

## Convert to retail or datacenter edition

First, check the current edition running the following command on PowerShell with admin rights:

```PowerShell
dism /online /get-currentedition
```

Second, list all the editions that you can convert your Windows Server running this command:

```PowerShell
dism /online /get-targeteditions
```

Third, get the product key correspondig to your Windows Server Edition from [this list](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys#generic-volume-license-keys-gvlk) and replace it in the following command: 

Please change **EDITION** for the name of the version you want convert to obtained in the second step and PRODUCT_KEY for the serial key obtained from the list

```PowerShell
dism /online /set-edition:EDITION /productkey:PRODUCT_KEY /accepteula
```

Restart the machine.


## Activate

For activating Windows Server, open CMD with admin rights and run the following commands **(recommended run one by one)**:

**Please change *PRODUCT_KEY* for the corresponding serial key depending on you Windows version, for a list of serial keys [enter here](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys)**.

```cmd
slmgr /ipk PRODUCT_KEY
slmgr /skms e8.us.to
slmgr /ato
```

If you get error **0x80070005** it means the activation server is busy, just try again running ```slmgr /ato``` until it is successful.