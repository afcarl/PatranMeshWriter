
program test
use PNFW
implicit none
! real(kind=8) :: nodes(3,72)
real(kind=8), allocatable :: nodes(:,:)
integer, allocatable :: elements(:,:)
! integer :: elements(8,25)
character*80 :: meshfile,title
integer i,j,no_of_nodes,no_of_elements
open(30,file='example.txt')
read(30, '(i8)') no_of_nodes
allocate(nodes(3,no_of_nodes))
do i=1,no_of_nodes
read(30,*) nodes(1,i),nodes(2,i),nodes(3,i)
end do
read(30, '(i8)') no_of_elements
allocate(elements(8,no_of_elements)) 
do i=1,no_of_elements
read(30,*) (elements(j,i),j=1,8)
end do
close(30)
meshfile ='sonu.mesh'
title='Good Mesh cube'
call writeMesh(nodes,elements,6,meshfile,title)
deallocate(elements)
deallocate(nodes)
end program
