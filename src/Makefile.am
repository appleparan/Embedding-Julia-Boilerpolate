include $(top_srcdir)/Makefile.common

lib_LTLIBRARIES = libpocel.la
libpocel_includedir = $(top_srcdir)/include
libpocel_la_SOURCES = pocel.c

#AM_CFLAGS	= -fPIC -Wall -g -std=c++11 -I$(top_srcdir)/include
#AM_CPPFLAGS = -fPIC -Wall -g -std=c++11 -I$(top_srcdir)/include
#AM_CXXFLAGS = -fPIC -Wall -g -std=c++11 -I$(top_srcdir)/include

libpocel_la_CFLAGS = $(AM_CFLAGS)
libpocel_la_CPPFLAGS = $(AM_CPPFLAGS)
libpocel_la_LDFLAGS = $(AM_LDFLAGS)
libpocel_la_LIBADD = $(AM_LIBS)

# Julia
libpocel_la_CFLAGS += 
libpocel_la_CPPFLAGS += 
libpocel_la_LDFLAGS += $(shell $(JL_SHARE)/julia-config.jl "--ldflags") $(shell $(JL_SHARE)/julia-config.jl "--ldlibs")
libpocel_la_LIBADD += -ljulia


