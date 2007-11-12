# C++ Console Executable Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=DebugDLL
endif

ifeq ($(CONFIG),DebugDLL)
  BINDIR := ../../lib/DebugDLL
  LIBDIR := ../../lib/DebugDLL
  OBJDIR := obj/drawstuff/DebugDLL
  OUTDIR := ../../lib/DebugDLL
  CPPFLAGS := -MMD -D "WIN32" -D "DS_DLL" -D "USRDLL" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -shared -Wl,--out-implib="../../lib/DebugDLL/libdrawstuff.a" -luser32 -lopengl32 -lglu32 -lwinmm -lgdi32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "DS_DLL" -D "USRDLL" -I "../../include"
  TARGET := drawstuff.dll
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseDLL)
  BINDIR := ../../lib/ReleaseDLL
  LIBDIR := ../../lib/ReleaseDLL
  OBJDIR := obj/drawstuff/ReleaseDLL
  OUTDIR := ../../lib/ReleaseDLL
  CPPFLAGS := -MMD -D "WIN32" -D "DS_DLL" -D "USRDLL" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O3 -fomit-frame-pointer
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -shared -Wl,--out-implib="../../lib/ReleaseDLL/libdrawstuff.a" -s -luser32 -lopengl32 -lglu32 -lwinmm -lgdi32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "DS_DLL" -D "USRDLL" -I "../../include"
  TARGET := drawstuff.dll
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),DebugLib)
  BINDIR := ../../lib/DebugLib
  LIBDIR := ../../lib/DebugLib
  OBJDIR := obj/drawstuff/DebugLib
  OUTDIR := ../../lib/DebugLib
  CPPFLAGS := -MMD -D "WIN32" -D "DS_LIB" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -luser32 -lopengl32 -lglu32 -lwinmm -lgdi32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "DS_LIB" -I "../../include"
  TARGET := libdrawstuff.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseLib)
  BINDIR := ../../lib/ReleaseLib
  LIBDIR := ../../lib/ReleaseLib
  OBJDIR := obj/drawstuff/ReleaseLib
  OUTDIR := ../../lib/ReleaseLib
  CPPFLAGS := -MMD -D "WIN32" -D "DS_LIB" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O3 -fomit-frame-pointer
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -s -luser32 -lopengl32 -lglu32 -lwinmm -lgdi32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "DS_LIB" -I "../../include"
  TARGET := libdrawstuff.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/drawstuff.o \
	$(OBJDIR)/windows.o \

RESOURCES := \
	$(OBJDIR)/resources.res \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin/sh.exe,$(SHELL))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking drawstuff
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning drawstuff
ifeq ($(MKDIR_TYPE),posix)
	-@rm -f $(OUTDIR)/$(TARGET)
	-@rm -rf $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/drawstuff.o: ../../drawstuff/src/drawstuff.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/windows.o: ../../drawstuff/src/windows.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/resources.res: ../../drawstuff/src/resources.rc
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@windres $< -O coff -o $@ $(RESFLAGS)

-include $(OBJECTS:%.o=%.d)

