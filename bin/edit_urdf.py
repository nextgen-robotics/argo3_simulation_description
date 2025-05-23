#! /usr/bin/python3.8



from argparse import ArgumentParser
import xml.etree.ElementTree as ET


parser = ArgumentParser("test_parser")

parser.add_argument("-f", help="URDF filename", required=True, action="store", dest="urdf_filename")


args = parser.parse_args()



if __name__ == '__main__':
    tree = ET.parse(args.urdf_filename)
    root = tree.getroot()




    meshes = root.findall(".//mesh")

    for mesh in meshes:
        tmp = mesh.attrib['filename'].replace('package://argo3_description', '.')
        mesh.set("filename", tmp)


    tree.write(args.urdf_filename.replace('argo3.urdf','argo3_web.urdf'))

