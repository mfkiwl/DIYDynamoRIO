# **********************************************************
# Copyright (c) 2010-2016 Google, Inc.  All rights reserved.
# Copyright (c) 2008-2009 VMware, Inc.  All rights reserved.
# **********************************************************

# Dr. Memory: the memory debugger
#
# This library is free software you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation
# version 2.1 of the License, and no later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Library General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

===========================================================================
                     D O C T O R   M E M O R Y
===========================================================================

===========================================================================
What is Dr. Memory?

Dr. Memory is a memory monitoring tool capable of identifying
memory-related programming errors such as accesses of uninitialized memory,
accesses to unaddressable memory (including outside of allocated heap units
and heap underflow and overflow), accesses to freed memory, double frees,
memory leaks, and (on Windows) handle leaks, GDI API usage errors, and
accesses to un-reserved thread local storage slots.

Dr. Memory is based on the DynamoRIO binary translation engine.  Dr. Memory
has full support for Windows (XP and higher) and Linux, with preliminary
Mac OSX, Linux/ARM, and Android/ARM support (32-bit only for those three)
available as a Beta release.

Dr. Memory also includes a system call tracing tool for Windows and a
symbol query utility.

===========================================================================
How do I use Dr. Memory?

Build your application with debug information and then run it under
Dr. Memory.  Errors found are printed to the screen, and a summary is shown
at the end of the run.

--------------------------------------------------
Quick start for Linux:

1) g++ -m32 -g -fno-inline -fno-omit-frame-pointer *.cpp -o myapp
2) bin/drmemory -- ./myapp args_to_myapp

--------------------------------------------------
Quick start for Windows:

If you used the installer, it added Dr. Memory to the current user's PATH,
and a fresh shell should find the "drmemory" command:

1) cl /Zi /MT /EHsc /Oy- /Ob0 /Femyapp.exe *.cpp
2) drmemory -- myapp.exe args_to_my_app

--------------------------------------------------
Quick start for Mac:

1) c++ -m32 -g -fno-inline -fno-omit-frame-pointer *.cpp -o myapp
2) bin/drmemory -- ./myapp args_to_myapp

===========================================================================
Full Documentation

If you are viewing this file, you have already successfully unpacked the
Dr. Memory distribution archive.  To view the documention, point your web
browser at the drmemory/docs/html/index.html file, or online at
http://drmemory.org/docs/.

===========================================================================
Contact

This project is provided as-is, with no official support.  Use
the Dr. Memory Users group at
http://groups.google.com/group/drmemory-users/ to ask questions and seek
help on using Dr. Memory.

Dr. Memory's source code and issue tracker live at
https://github.com/DynamoRIO/drmemory

If you would like to submit a patch, you will need to first sign a
Contributor License Agreement.  See
https://github.com/DynamoRIO/drmemory/wiki/Contributing for more information.

===========================================================================
