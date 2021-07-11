#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys, numpy, pyopenjtalk
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl, QObject, Slot, Property, QThread, Signal, QMutex, QMutexLocker
import simpleaudio as sa
import feedparser
import pprint

def Main():
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    HERE = os.path.dirname(os.path.abspath(__file__))
    UI = os.path.join(HERE, 'ui.qml')
    engine.load(UI)
    if not engine.rootObjects(): sys.exit(-1)
    sys.exit(app.exec_())

if __name__ == '__main__':
    Main()
