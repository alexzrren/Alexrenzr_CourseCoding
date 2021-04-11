# -*- coding: utf-8 -*-
"""
@Author  : Zirui Ren
@Time    : 2021/4/9 0:55
@Contact : 1131061444@qq.com/renzirui@webmail.hzau.edu.cn
@File    : Turtle_Hierarchical_Network.py
@Desc: Drawing Hierarchical Network by turtle package
"""
import turtle


def corgen_diagnoal(origin, offset):
    # generate 4 nodes in diagnol direction(x,y) with a given distance from origin
    symcor = [origin]
    origx, origy = origin[0], origin[1]
    negative = [True, False]
    for n_corx in negative:
        for n_cory in negative:
            if n_corx:
                corx = origx - offset
            else:
                corx = origx + offset
            if n_cory:
                cory = origy - offset
            else:
                cory = origy + offset
            symcor.append([corx, cory])
    return symcor


def corgen_axial(origin, offset):
    # generate 4 nodes in axial direction(x,y) with a given distance from origin
    symcor = [origin]
    origx, origy = origin[0], origin[1]
    negative = [True, False]
    ify = [True, False]
    for n_offset in negative:
        for y_offset in ify:
            if y_offset:
                corx = origx
                if n_offset:
                    cory = origy - offset
                else:
                    cory = origy + offset
            else:
                cory = origy
                if n_offset:
                    corx = origx - offset
                else:
                    corx = origx + offset
            symcor.append([corx, cory])
    return symcor


def draw_node(nodes):
    turtle.pensize(15)
    turtle.up()
    for node in nodes:
        turtle.goto(node)
        turtle.down()
        turtle.goto(node)
        turtle.up()


def draw_edge(origin, nodes):
    # connect nodes to its origin
    turtle.pensize(1)
    for node in nodes:
        turtle.up()
        turtle.goto(origin)
        turtle.down()
        turtle.goto(node)


def draw_sqedge(nodes):
    # connect nodes from same layer
    sequence = [0, 1, 3, 2]
    nodes = nodes[1:]
    turtle.pensize(1)
    orig = nodes[0]
    turtle.up()
    for nodeindex in sequence:
        turtle.goto(nodes[nodeindex])
        turtle.down()
    turtle.goto(orig)
    turtle.up()


if __name__ == '__main__':
    origin = [0, 0]
    turtle.setup(1000, 1000, 0, 0)
    turtle.speed(1000)
    turtle.pencolor("black")
    ngrp1 = corgen_diagnoal([0, 0], 300)
    draw_node(ngrp1)
    for node1 in ngrp1:
        ngrp2 = corgen_axial(node1, 100)
        draw_node(ngrp2)
        ngrp2.pop(0)
        draw_edge(origin, ngrp2)
        ngrp3a = corgen_diagnoal(node1, 20)
        draw_sqedge(ngrp3a)
        draw_node(ngrp3a)
        draw_edge(node1, ngrp3a)
        for node2 in ngrp2:
            ngrp3 = corgen_diagnoal(node2, 20)
            draw_node(ngrp3)
            draw_edge(node2, ngrp3)
            draw_edge(origin, ngrp3)
            draw_sqedge(ngrp3)
            ngrp3.pop(0)
            draw_edge(node1, ngrp3)
    turtle.hideturtle()
    ts = turtle.getscreen()
    ts.getcanvas().postscript(file="hierarchical_network.eps")
    turtle.done()


