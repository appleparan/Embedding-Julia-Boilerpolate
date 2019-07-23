include $(top_srcdir)/Makefile.common

lib_LTLIBRARIES = libembed.la
libembed_includedir = $(top_srcdir)/include
libembed_la_SOURCES = embed.c

libembed_la_CFLAGS = $(AM_CFLAGS)
libembed_la_CPPFLAGS = $(AM_CPPFLAGS)
libembed_la_LDFLAGS = $(AM_LDFLAGS)
libembed_la_LIBADD = $(AM_LIBS)

# Julia
libembed_la_CFLAGS += 
libembed_la_CPPFLAGS += 
libembed_la_LDFLAGS += $(shell $(JL_SHARE)/julia-config.jl "--ldflags") $(shell $(JL_SHARE)/julia-config.jl "--ldlibs")
libembed_la_LIBADD += -ljulia


