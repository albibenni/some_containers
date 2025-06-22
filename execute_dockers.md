## List

- Ubuntu emulation:
  `docker build --tag=linux --file=ubuntu_emulation.Dockerfile .` - build the Docker image with the tag - name `linux` using the filename `ubuntu_emulation.Dockerfile`. - remember the `.` at the end to specify the current directory as the build context.
  `docker run -it --rm --name=ubuntu_emulation linux` - interactive terminal `i`, pseudo--tty `t`, with `--rm` to remove container after exit and `--name` to name the container.
  `docker run -it --name=ubuntu_emulation linux` - to keep the container
  `docker run ubuntu_emulation -i` - to run the container saved iterativly (cli)
