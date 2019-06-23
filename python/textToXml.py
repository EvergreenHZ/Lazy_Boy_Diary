#coding:utf-8
from xml.etree.ElementTree import Element, SubElement, ElementTree
import xml.dom.minidom
from lxml import etree
import os
import cv2 as cv
import numpy as np
#美化一下
def indent( elem, level=0):
    i = "\n" + level*"  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        for e in elem:
            indent(e, level+1)
        if not e.tail or not e.tail.strip():
            e.tail = i
    if level and (not elem.tail or not elem.tail.strip()):
        elem.tail = i
    return elem

def addobject(root):
    objectxml = SubElement(root, 'object')
    objectnamexml = SubElement(objectxml, 'name')
    objectnamexml.text = str(type)
    objectposexml = SubElement(objectxml, 'pose')
    objectposexml.text = 'left'
    objecttruncatedxml = SubElement(objectxml, 'truncated')
    objecttruncatedxml.text = '0'
    objectdifficultxml = SubElement(objectxml, 'difficult')
    objectdifficultxml.text = '0'

    objectbndboxxml = SubElement(objectxml, 'bndbox')
    xminxml = SubElement(objectbndboxxml, 'xmin')
    yminxml = SubElement(objectbndboxxml, 'ymin')
    xmaxxml = SubElement(objectbndboxxml, 'xmax')
    ymaxxml = SubElement(objectbndboxxml, 'ymax')
    xminxml.text = str(xmin)
    yminxml.text = str(ymin)
    xmaxxml.text = str(xmax)
    ymaxxml.text = str(ymax)

#如果没有对应的xml，则对当前的图片标记生成xml文件且写入
def creatxml():
    doc = xml.dom.minidom.Document()
    root = doc.createElement('annotation')
    doc.appendChild(root)

    root = Element('annotation')
    folderxml = SubElement(root, 'folder')
    folderxml.text = 'VOC2007'
    filenamexml = SubElement(root, 'filename')
    filenamexml.text = imgName
    sourcexml = SubElement(root, 'source')
    databasexml = SubElement(sourcexml, 'database')
    databasexml.text = 'cheguo'

    ownerxml = SubElement(root, 'owner')
    ownernamexml = SubElement(ownerxml, 'name')
    ownernamexml.text = 'zjgsu_xxl414'

    sizexml = SubElement(root, 'size')
    widthxml = SubElement(sizexml, 'width')
    widthxml.text = str(width)
    hightxml = SubElement(sizexml, 'hight')
    hightxml.text = str(hight)
    depthxml = SubElement(sizexml, 'depth')
    depthxml.text = str(depth)

    segmentedxml = SubElement(root, 'segmented')
    segmentedxml.text = str(0)

    addobject(root)
    print(root)
    tree = ElementTree(root)
    indent(root)
    tree.write(xmlFilePath + '/' + xmlName)

def insertxml(xmlFile):
    ET = ElementTree()
    tree = ET.parse(xmlFile)
    print(tree)
    root = ET.getroot()
    print(tree)
    addobject(root)
    tree = ElementTree(root)
    indent(root)
    tree.write(xmlFilePath + '/' + xmlName)


imgFilePath = './flickr_logos_27_dataset_images'
xmlFilePath = './xml'
with open('./train_annot_with_bg_class.txt') as f:
    for line in f.readlines():
        text = line.strip('\n').split(' ')
        print(text)
        imgName = text[0]
        type = text[1]
        if(type =='Background'):
            continue
        xmin = text[2]
        ymin = text[3]
        xmax = text[4]
        ymax = text[5]
        xmlName = str(imgName.strip('.jpg')) + '.xml'
        print(imgName)


        img = cv.imread(imgFilePath+'/'+imgName)
        if(img is None):
            print("wrong")
        else:
            print('exist')
        hight, width, depth = img.shape[0:3]

        #判断有没有xml文件没有创建，有则加入
        if os.path.exists(xmlFilePath+'/'+xmlName):
            insertxml(xmlFilePath+'/'+xmlName)
        else:
            creatxml()


