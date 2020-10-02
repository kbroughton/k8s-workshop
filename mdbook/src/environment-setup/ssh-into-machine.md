# SSH into machines

## SSH into the student machine

* Run the following command from your terminal. Make sure you `STUDENTVMIP` ip address is defined in the
environment or defined in /etc/hosts

```bash
ssh student@$STUDENTVMIP
```

![ssh into student vm](images/student-ssh.png)


## SSH into the ctf machine

* Run the following command from your terminal. Make sure you replace the `CTFVMIP` ip address with your ctf vm ip address

```bash
ssh ctf@$CTFVMIP
```

![ssh into ctf vm](images/ctf-ssh.png)
