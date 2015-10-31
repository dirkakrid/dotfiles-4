function createvm(){
  NAME=${1}
  MEMORY=${2:-2048}
  DISKSIZE=${3:-30720}
  DISKIMAGE=${4:-ubuntu.iso}

  if [[ -z $NAME ]]; then
    echo "Please provide a name"
    return
  fi

  existingVMs=`VBoxManage list vms | grep $NAME`
  if [ $? -eq 0 ]; then
    echo "A VM already exists with the name: ${NAME}"
    return
  fi

  if [ ! -f $DISKIMAGE ]; then
    echo "Unable to find diskimage: ${DISKIMAGE}"
    return
  fi

  echo "Creating VM: ${NAME}..."
  echo "Details: "
  echo "  Memory: ${MEMORY}"
  echo "  DiskSize: ${DISKSIZE}"

  # Create the VM
  VBoxManage createvm --name $NAME --register

  # Modify the box
  VBoxManage modifyvm $NAME --memory $MEMORY --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 en0 --ostype Ubuntu

  # Create stoage
  VBoxManage storagectl $NAME --name "IDE Controller" --add ide
  VBoxManage createvdi --filename ~/.vms/$NAME/${NAME}-disk01.vdi --size $DISKSIZE

  # Attach Storage
  VBoxManage storageattach $NAME --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium ~/.vms/$NAME/${NAME}-disk01.vdi
  VBoxManage storageattach $NAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $DISKIMAGE

  # Start the box
  VBoxHeadless --startvm $NAME --vrde off &
}
