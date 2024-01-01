# Nothing fancy yet, just blocks. Linearized.
# Up to 823725 (when finished uploading)

LP=linearized.pages.dev
last=$(wget -qO - $LP/last.txt | grep -o '[0-9]\+')
for i in $(seq -w 00000 $last); do wget $LP/blk$i.dat; done

#       #####   #####   #####  
#      #     # #     # #     # 
#      #     #       #       # 
#       #####   #####   #####  
#      #     # #             # 
#      #     # #       #     # 
#       #####  #######  #####  
#
#      #######  #####  ####### 
#      #    #  #     # #       
#          #         # #       
#         #     #####  ######  
#        #     #             # 
#        #     #       #     # 
#        #     #######  #####  
#
#  ,---   .123 4567 89ab cdef   ---,
#  | ..   .... .... .... ....   .f |
#  | 1.   .... 94.3 ae95 c636   1f |
#  | 2.   c54. 3264 d3c3 afa4   2f |
#  | 3.   68e7 1965 51a5 3265   3f |
#  '===   ==== ==== ==== ====   ==='
#   sf:   94.3 c54. 3265 
#   sk:   3265 95
#  ................ |..|.|........||
