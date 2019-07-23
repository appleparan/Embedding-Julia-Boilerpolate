include $(top_srcdir)/Makefile.common

check_PROGRAMS = julia_embedding
julia_embedding_SOURCES = julia_embedding.c 

LIBADD = $(top_srcdir)/src/libpocel.la

TESTS = $(check_PROGRAMS)

julia_embedding_CFLAGS = $(AM_CFLAGS)
julia_embedding_CPPFLAGS = $(AM_CPPFLAGS)
julia_embedding_LDFLAGS = $(AM_LDFLAGS)
julia_embedding_LDADD = $(AM_LIBS)

# Julia
julia_embedding_CFLAGS += 
julia_embedding_CPPFLAGS += 
julia_embedding_LDFLAGS += $(shell $(JL_SHARE)/julia-config.jl "--ldflags") $(shell $(JL_SHARE)/julia-config.jl "--ldlibs")
julia_embedding_LDADD += -ljulia $(top_srcdir)/src/libpocel.la




