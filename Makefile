NVCC=nvcc
CC=nvcc
NVCCFLAGS=-use_fast_math -O3
CFLAGS=-O3

QuickSES: CudaSurf.o cpdb/cpdb.o cpdb/utils.o SmoothMesh.o
	$(CC) -o QuickSES $(CFLAGS) cpdb/cpdb.o cpdb/utils.o SmoothMesh.o CudaSurf.o


CudaSurf.o: CudaSurf.cu
	$(NVCC) -c -o CudaSurf.o CudaSurf.cu -Icpdb/ $(NVCCFLAGS)

SmoothMesh.o: SmoothMesh.cpp
	$(CC) -c -o SmoothMesh.o SmoothMesh.cpp $(CFLAGS)

cpdb/utils.o: cpdb/utils.cpp
	$(CC) -c -o cpdb/utils.o cpdb/utils.cpp $(CFLAGS)

cpdb/cpdb.o: cpdb/cpdb.cpp
	$(CC) -c -o cpdb/cpdb.o cpdb/cpdb.cpp $(CFLAGS)



clean:
	rm -f *.o QuickSES
	rm -f cpdb/*.o


#nvcc --shared CudaSurf.cu cpdb/*.cpp -Icpdb/ SmoothMesh.cpp -o QuickSES.dll -use_fast_math -O3 --compiler-options "-fPIC"
