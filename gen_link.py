#!/usr/bin/python3
import sys
import argparse


def main():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--file', action="store", help='src file for trackers', required=True)
    parser.add_argument('--dn', action="store", help='download name', required=True)
    args = parser.parse_args()

    hash = 'test'
    s = "magnet:?xt=urn:ed2k:" + hash
    s += "&dn=" + args.dn

    f = open(args.file, 'r')
    for line in f:
        if "://" in line:
            line = line.replace("://", "%3A%2F%2F").replace("/", "%2F").rstrip()
            s += "&tr=" + line

    print(s)

if __name__== "__main__":
    main()
