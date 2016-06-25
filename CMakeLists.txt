cmake_minimum_required(VERSION 3.5)
project(MyDoc NONE)
include(UseLATEX.cmake)

set(SOLUTION "\\showsoln \\setsolncolor{red}")
#set(SOLUTION " ")

set(PDF_LOCATION ../PDFs/)

ADD_CUSTOM_TARGET (nuke @echo cleaning for source distribution)
ADD_CUSTOM_COMMAND(
    DEPENDS clean
    COMMENT "distribution clean"
    COMMAND rm
    ARGS    -Rf * .DS_Store ${PDF_LOCATION}/*
	TARGET  nuke
	)

ADD_CUSTOM_TARGET (copy @echo move all pdfs to one directory)
ADD_CUSTOM_COMMAND(
	COMMENT "pdf copy"
    COMMAND mkdir
    ARGS    -p ${PDF_LOCATION}
    COMMAND cp
    ARGS    `find . -name \*.pdf` ${PDF_LOCATION}
	TARGET  copy
	)

ADD_CUSTOM_TARGET (clean-pdf @echo cleaning pdfs in output directory)
ADD_CUSTOM_COMMAND(
	COMMENT "clean pdf"
    COMMAND rm
    ARGS    -f ${PDF_LOCATION}/*.pdf
	TARGET  clean-pdf
	)


add_subdirectory(Notetakers/Block_1/Lesson_1)
add_subdirectory(Notetakers/Block_1/Lesson_2)
add_subdirectory(Notetakers/Block_1/Lesson_3)
add_subdirectory(Notetakers/Block_1/Lesson_6)
add_subdirectory(Notetakers/Block_1/Lesson_7)
add_subdirectory(Notetakers/Block_1/Lesson_8)
add_subdirectory(Notetakers/Block_1/Lesson_9)
add_subdirectory(Notetakers/Block_1/Lesson_10)

add_subdirectory(Notetakers/Block_2/Lesson_13)
add_subdirectory(Notetakers/Block_2/Lesson_14)
add_subdirectory(Notetakers/Block_2/Lesson_15)
add_subdirectory(Notetakers/Block_2/Lesson_16)
add_subdirectory(Notetakers/Block_2/Lesson_17)
add_subdirectory(Notetakers/Block_2/Lesson_19)
add_subdirectory(Notetakers/Block_2/Lesson_20)
add_subdirectory(Notetakers/Block_2/Lesson_21)
add_subdirectory(Notetakers/Block_2/Lesson_22)
add_subdirectory(Notetakers/Block_2/Lesson_23)

add_subdirectory(Notetakers/Block_3/Lesson_28)
add_subdirectory(Notetakers/Block_3/Lesson_29)
add_subdirectory(Notetakers/Block_3/Lesson_30)
add_subdirectory(Notetakers/Block_3/Lesson_31)
add_subdirectory(Notetakers/Block_3/Lesson_33)
add_subdirectory(Notetakers/Block_3/Lesson_34)
add_subdirectory(Notetakers/Block_3/Lesson_35)
add_subdirectory(Notetakers/Block_3/Lesson_36)
