#libvirt_source-packages_dir:
 # file.directory:
 #   - name: /opt/so/conf/libvirt/source-packages

install_libvirt-libs:
  pkg.installed:
    - name: libvirt-libs

# provides virsh
install_libvirt-client:
  pkg.installed:
    - name: libvirt-client

libvirt_python_wheel:
  file.recurse:
    - name: /opt/so/conf/libvirt/source-packages/libvirt-python
    - source: salt://libvirt/source-packages/libvirt-python
    - makedirs: True
    - clean: True

libvirt_python_module:
  cmd.run:
    - name: /opt/saltstack/salt/bin/python3.10 -m pip install --no-index --find-links=/opt/so/conf/libvirt/source-packages/libvirt-python libvirt-python
    - onchanges:
      - file: libvirt_python_wheel
