CC = gcc
CXX = g++
CXXFLAGS = -Wall -Wextra -O2
LDLIBS = -lboost_system-mt -lboost_coroutine-mt -lboost_context-mt
# CXXFLAGS = -lboost_system-mt
-include $(OBJS:.o=.d)

%.o: %.c
	$(CC) -c $(CFLAGS) $*.c -o $*.o
	$(CC) -MM -MP $(CFLAGS) $*.c > $*.d
%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $*.cpp -o $*.o
	$(CXX) -MM -MP $(CXXFLAGS) $*.cpp > $*.d
%.o: %.cc
	$(CXX) -c $(CXXFLAGS) $*.cc -o $*.o
	$(CXX) -MM -MP $(CXXFLAGS) $*.cc > $*.d
%.out: %.cc
	$(CXX) $(CXXFLAGS) $*.cc -o $*.out $(LDLIBS)
	$(CXX) -MM -MP $(CXXFLAGS) $*.cc > $*.d
.PHONY:clean
clean:
	rm -f *.o *.s *.i $(ELFS) *.d *.out