/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void kmeans(signed short (*llvm_cbe_image_in)[256], signed short (*llvm_cbe_final)[256]);


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str[3] = "%d";


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void kmeans(signed short (*llvm_cbe_image_in)[256], signed short (*llvm_cbe_final)[256]) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  signed short llvm_cbe_tmp__1[65536];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  signed short llvm_cbe_tmp__2[65536];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  signed short llvm_cbe_tmp__3[65536];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  signed short llvm_cbe_tmp__4[65536];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge64_count = 0;
  unsigned short llvm_cbe_storemerge64;
  unsigned short llvm_cbe_storemerge64__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2863_count = 0;
  unsigned short llvm_cbe_storemerge2863;
  unsigned short llvm_cbe_storemerge2863__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe__2e_sum29_count = 0;
  unsigned int llvm_cbe__2e_sum29;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  signed short *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  signed short *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  signed short *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  signed short *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  unsigned short llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond79_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned short llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond80_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge161_count = 0;
  unsigned short llvm_cbe_storemerge161;
  unsigned short llvm_cbe_storemerge161__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  unsigned short llvm_cbe_tmp__14;
  unsigned short llvm_cbe_tmp__14__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  unsigned int llvm_cbe_tmp__15;
  unsigned int llvm_cbe_tmp__15__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  unsigned int llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2158_count = 0;
  unsigned short llvm_cbe_storemerge2158;
  unsigned short llvm_cbe_storemerge2158__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  unsigned short llvm_cbe_tmp__18;
  unsigned short llvm_cbe_tmp__18__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  unsigned int llvm_cbe_tmp__19;
  unsigned int llvm_cbe_tmp__19__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  signed short *llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  unsigned short llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  unsigned int llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_ispos_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg_count = 0;
  unsigned int llvm_cbe_neg;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned int llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned short llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_ispos_2e_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg_2e_1_count = 0;
  unsigned int llvm_cbe_neg_2e_1;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  unsigned short llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_ispos_2e_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg_2e_2_count = 0;
  unsigned int llvm_cbe_neg_2e_2;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  unsigned int llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  unsigned short llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_ispos_2e_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg_2e_3_count = 0;
  unsigned int llvm_cbe_neg_2e_3;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned short llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge23_2e__count = 0;
  unsigned short llvm_cbe_storemerge23_2e_;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned short llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge23_2e__2e_1_count = 0;
  unsigned short llvm_cbe_storemerge23_2e__2e_1;
  static  unsigned long long aesl_llvm_cbe__2e__2e_1_count = 0;
  unsigned short llvm_cbe__2e__2e_1;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge23_2e__2e_2_count = 0;
  unsigned short llvm_cbe_storemerge23_2e__2e_2;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum27_count = 0;
  unsigned int llvm_cbe__2e_sum27;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  signed short *llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum26_count = 0;
  unsigned int llvm_cbe__2e_sum26;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  signed short *llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum25_count = 0;
  unsigned int llvm_cbe__2e_sum25;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  signed short *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum24_count = 0;
  unsigned int llvm_cbe__2e_sum24;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  signed short *llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  unsigned int llvm_cbe_tmp__41;
  unsigned int llvm_cbe_tmp__41__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  unsigned short llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond77_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  unsigned short llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond78_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge248_count = 0;
  unsigned short llvm_cbe_storemerge248;
  unsigned short llvm_cbe_storemerge248__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1647_count = 0;
  unsigned short llvm_cbe_storemerge1647;
  unsigned short llvm_cbe_storemerge1647__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  unsigned short llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond69_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  unsigned short llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond70_count = 0;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge342_count = 0;
  unsigned short llvm_cbe_storemerge342;
  unsigned short llvm_cbe_storemerge342__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge440_count = 0;
  unsigned short llvm_cbe_storemerge440;
  unsigned short llvm_cbe_storemerge440__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  unsigned int llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned int llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
  signed short *llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  unsigned short llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  signed short *llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  unsigned short llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  signed short *llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  unsigned short llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;
  signed short *llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  unsigned short llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  unsigned short llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  unsigned short llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  unsigned short llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  unsigned short llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  unsigned short llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  unsigned short llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  unsigned short llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  signed short *llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  unsigned short llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
  static  unsigned long long aesl_llvm_cbe_492_count = 0;
  static  unsigned long long aesl_llvm_cbe_493_count = 0;
  static  unsigned long long aesl_llvm_cbe_494_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_495_count = 0;
  static  unsigned long long aesl_llvm_cbe_496_count = 0;
  unsigned short llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_497_count = 0;
  static  unsigned long long aesl_llvm_cbe_498_count = 0;
  static  unsigned long long aesl_llvm_cbe_499_count = 0;
  static  unsigned long long aesl_llvm_cbe_500_count = 0;
  static  unsigned long long aesl_llvm_cbe_501_count = 0;
  static  unsigned long long aesl_llvm_cbe_502_count = 0;
  static  unsigned long long aesl_llvm_cbe_503_count = 0;
  static  unsigned long long aesl_llvm_cbe_504_count = 0;
  static  unsigned long long aesl_llvm_cbe_505_count = 0;
  static  unsigned long long aesl_llvm_cbe_506_count = 0;
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond65_count = 0;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @kmeans\n");
  llvm_cbe_storemerge64__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  goto llvm_cbe__2e_preheader62;

  do {     /* Syntactic loop '.preheader62' to make GCC happy */
llvm_cbe__2e_preheader62:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge64 = phi i16 [ 0, %%0 ], [ %%15, %%14  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge64_count);
  llvm_cbe_storemerge64 = (unsigned short )llvm_cbe_storemerge64__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge64 = 0x%X",llvm_cbe_storemerge64);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__13);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i16 %%storemerge64 to i32, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_158_count);
  llvm_cbe_tmp__5 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge64);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl nsw i32 %%5, 8, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__6 = (unsigned int )llvm_cbe_tmp__5 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
  llvm_cbe_storemerge2863__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  goto llvm_cbe_tmp__68;

llvm_cbe_tmp__69:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add i16 %%storemerge64, 1, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__13 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge64&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__13&65535ull)));
  if (((llvm_cbe_tmp__13&65535U) == (((unsigned short )256)&65535U))) {
    llvm_cbe_storemerge161__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
    llvm_cbe_tmp__14__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
    llvm_cbe_tmp__15__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader52;
  } else {
    llvm_cbe_storemerge64__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__13;   /* for PHI node */
    goto llvm_cbe__2e_preheader62;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__68:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2863 = phi i16 [ 0, %%.preheader62 ], [ %%13, %%7  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge2863_count);
  llvm_cbe_storemerge2863 = (unsigned short )llvm_cbe_storemerge2863__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2863 = 0x%X",llvm_cbe_storemerge2863);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__12);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i16 %%storemerge2863 to i32, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__7 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge2863);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum29 = add i32 %%8, %%6, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum29_count);
  llvm_cbe__2e_sum29 = (unsigned int )((unsigned int )(llvm_cbe_tmp__7&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__6&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum29 = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum29&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [65536 x i16]* %%1, i32 0, i32 %%.sum29, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__8 = (signed short *)(&llvm_cbe_tmp__1[(((signed int )llvm_cbe__2e_sum29))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum29 = 0x%X",((signed int )llvm_cbe__2e_sum29));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum29) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 0, i16* %%9, align 2, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_163_count);
  *llvm_cbe_tmp__8 = ((unsigned short )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [65536 x i16]* %%2, i32 0, i32 %%.sum29, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__9 = (signed short *)(&llvm_cbe_tmp__2[(((signed int )llvm_cbe__2e_sum29))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum29 = 0x%X",((signed int )llvm_cbe__2e_sum29));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum29) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 0, i16* %%10, align 2, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_165_count);
  *llvm_cbe_tmp__9 = ((unsigned short )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds [65536 x i16]* %%3, i32 0, i32 %%.sum29, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_166_count);
  llvm_cbe_tmp__10 = (signed short *)(&llvm_cbe_tmp__3[(((signed int )llvm_cbe__2e_sum29))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum29 = 0x%X",((signed int )llvm_cbe__2e_sum29));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum29) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 0, i16* %%11, align 2, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_167_count);
  *llvm_cbe_tmp__10 = ((unsigned short )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [65536 x i16]* %%4, i32 0, i32 %%.sum29, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__11 = (signed short *)(&llvm_cbe_tmp__4[(((signed int )llvm_cbe__2e_sum29))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum29 = 0x%X",((signed int )llvm_cbe__2e_sum29));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum29) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 0, i16* %%12, align 2, !dbg !17 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_169_count);
  *llvm_cbe_tmp__11 = ((unsigned short )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add i16 %%storemerge2863, 1, !dbg !18 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_170_count);
  llvm_cbe_tmp__12 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge2863&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__12&65535ull)));
  if (((llvm_cbe_tmp__12&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__69;
  } else {
    llvm_cbe_storemerge2863__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__12;   /* for PHI node */
    goto llvm_cbe_tmp__68;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader62' */
  do {     /* Syntactic loop '.preheader52' to make GCC happy */
llvm_cbe__2e_preheader52:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge161 = phi i16 [ %%58, %%57 ], [ 0, %%14  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge161_count);
  llvm_cbe_storemerge161 = (unsigned short )llvm_cbe_storemerge161__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge161 = 0x%X",llvm_cbe_storemerge161);
printf("\n = 0x%X",llvm_cbe_tmp__43);
printf("\n = 0x%X",((unsigned short )0));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = phi i16 [ %%storemerge23..2, %%57 ], [ 0, %%14  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_188_count);
  llvm_cbe_tmp__14 = (unsigned short )llvm_cbe_tmp__14__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__14);
printf("\nstoremerge23..2 = 0x%X",llvm_cbe_storemerge23_2e__2e_2);
printf("\n = 0x%X",((unsigned short )0));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = phi i32 [ %%55, %%57 ], [ 0, %%14  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_189_count);
  llvm_cbe_tmp__15 = (unsigned int )llvm_cbe_tmp__15__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__15);
printf("\n = 0x%X",llvm_cbe_tmp__41);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = sext i16 %%storemerge161 to i32, !dbg !3 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__16 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge161);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = shl nsw i32 %%18, 8, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_198_count);
  llvm_cbe_tmp__17 = (unsigned int )llvm_cbe_tmp__16 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__17);
  llvm_cbe_storemerge2158__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  llvm_cbe_tmp__18__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__14;   /* for PHI node */
  llvm_cbe_tmp__19__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__15;   /* for PHI node */
  goto llvm_cbe_tmp__70;

llvm_cbe_tmp__71:
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = add i16 %%storemerge161, 1, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_382_count);
  llvm_cbe_tmp__43 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge161&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__43&65535ull)));
  if (((llvm_cbe_tmp__43&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__72;
  } else {
    llvm_cbe_storemerge161__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__43;   /* for PHI node */
    llvm_cbe_tmp__14__PHI_TEMPORARY = (unsigned short )llvm_cbe_storemerge23_2e__2e_2;   /* for PHI node */
    llvm_cbe_tmp__15__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__41;   /* for PHI node */
    goto llvm_cbe__2e_preheader52;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__70:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2158 = phi i16 [ 0, %%.preheader52 ], [ %%56, %%.thread34.thread  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge2158_count);
  llvm_cbe_storemerge2158 = (unsigned short )llvm_cbe_storemerge2158__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2158 = 0x%X",llvm_cbe_storemerge2158);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__42);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = phi i16 [ %%16, %%.preheader52 ], [ %%storemerge23..2, %%.thread34.thread  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_200_count);
  llvm_cbe_tmp__18 = (unsigned short )llvm_cbe_tmp__18__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__18);
printf("\n = 0x%X",llvm_cbe_tmp__14);
printf("\nstoremerge23..2 = 0x%X",llvm_cbe_storemerge23_2e__2e_2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = phi i32 [ %%17, %%.preheader52 ], [ %%55, %%.thread34.thread  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_201_count);
  llvm_cbe_tmp__19 = (unsigned int )llvm_cbe_tmp__19__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",llvm_cbe_tmp__15);
printf("\n = 0x%X",llvm_cbe_tmp__41);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = sext i16 %%storemerge2158 to i32, !dbg !3 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_202_count);
  llvm_cbe_tmp__20 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge2158);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds [256 x i16]* %%image_in, i32 %%18, i32 %%23, !dbg !3 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_203_count);
  llvm_cbe_tmp__21 = (signed short *)(&llvm_cbe_image_in[(((signed int )llvm_cbe_tmp__16))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__20))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__16));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__20));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__20) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image_in' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i16* %%24, align 2, !dbg !3 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__22 = (unsigned short )*llvm_cbe_tmp__21;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = sext i16 %%25 to i32, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_221_count);
  llvm_cbe_tmp__23 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%26, -5, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_222_count);
  llvm_cbe_tmp__24 = (unsigned int )((unsigned int )(llvm_cbe_tmp__23&4294967295ull)) + ((unsigned int )(4294967291u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__24&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%neg = sub i32 5, %%26, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_neg_count);
  llvm_cbe_neg = (unsigned int )((unsigned int )(5u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__23&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\nneg = 0x%X\n", ((unsigned int )(llvm_cbe_neg&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = select i1 %%ispos, i32 %%27, i32 %%neg, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__25 = (unsigned int )(((((signed int )llvm_cbe_tmp__24) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__24) : ((unsigned int )llvm_cbe_neg));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = trunc i32 %%28 to i16, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__26 = (unsigned short )((unsigned short )llvm_cbe_tmp__25&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = add nsw i32 %%26, -40, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__27 = (unsigned int )((unsigned int )(llvm_cbe_tmp__23&4294967295ull)) + ((unsigned int )(4294967256u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__27&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%neg.1 = sub i32 40, %%26, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_neg_2e_1_count);
  llvm_cbe_neg_2e_1 = (unsigned int )((unsigned int )(40u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__23&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\nneg.1 = 0x%X\n", ((unsigned int )(llvm_cbe_neg_2e_1&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = select i1 %%ispos.1, i32 %%30, i32 %%neg.1, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__28 = (unsigned int )(((((signed int )llvm_cbe_tmp__27) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__27) : ((unsigned int )llvm_cbe_neg_2e_1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = trunc i32 %%31 to i16, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_237_count);
  llvm_cbe_tmp__29 = (unsigned short )((unsigned short )llvm_cbe_tmp__28&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = add nsw i32 %%26, -80, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_248_count);
  llvm_cbe_tmp__30 = (unsigned int )((unsigned int )(llvm_cbe_tmp__23&4294967295ull)) + ((unsigned int )(4294967216u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__30&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%neg.2 = sub i32 80, %%26, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_neg_2e_2_count);
  llvm_cbe_neg_2e_2 = (unsigned int )((unsigned int )(80u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__23&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\nneg.2 = 0x%X\n", ((unsigned int )(llvm_cbe_neg_2e_2&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = select i1 %%ispos.2, i32 %%33, i32 %%neg.2, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_249_count);
  llvm_cbe_tmp__31 = (unsigned int )(((((signed int )llvm_cbe_tmp__30) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__30) : ((unsigned int )llvm_cbe_neg_2e_2));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = trunc i32 %%34 to i16, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__32 = (unsigned short )((unsigned short )llvm_cbe_tmp__31&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = add nsw i32 %%26, -180, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(llvm_cbe_tmp__23&4294967295ull)) + ((unsigned int )(4294967116u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__33&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%neg.3 = sub i32 180, %%26, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_neg_2e_3_count);
  llvm_cbe_neg_2e_3 = (unsigned int )((unsigned int )(180u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__23&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\nneg.3 = 0x%X\n", ((unsigned int )(llvm_cbe_neg_2e_3&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = select i1 %%ispos.3, i32 %%36, i32 %%neg.3, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_262_count);
  llvm_cbe_tmp__34 = (unsigned int )(((((signed int )llvm_cbe_tmp__33) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__33) : ((unsigned int )llvm_cbe_neg_2e_3));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = trunc i32 %%37 to i16, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__35 = (unsigned short )((unsigned short )llvm_cbe_tmp__34&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge23. = select i1 %%39, i16 1, i16 %%21, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge23_2e__count);
  llvm_cbe_storemerge23_2e_ = (unsigned short )(((((signed short )llvm_cbe_tmp__29) < ((signed short )llvm_cbe_tmp__26))) ? ((unsigned short )((unsigned short )1)) : ((unsigned short )llvm_cbe_tmp__18));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge23. = 0x%X\n", llvm_cbe_storemerge23_2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%39, i16 %%32, i16 %%29, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned short )(((((signed short )llvm_cbe_tmp__29) < ((signed short )llvm_cbe_tmp__26))) ? ((unsigned short )llvm_cbe_tmp__29) : ((unsigned short )llvm_cbe_tmp__26));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge23..1 = select i1 %%40, i16 2, i16 %%storemerge23., !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge23_2e__2e_1_count);
  llvm_cbe_storemerge23_2e__2e_1 = (unsigned short )(((((signed short )llvm_cbe_tmp__32) < ((signed short )llvm_cbe__2e_))) ? ((unsigned short )((unsigned short )2)) : ((unsigned short )llvm_cbe_storemerge23_2e_));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge23..1 = 0x%X\n", llvm_cbe_storemerge23_2e__2e_1);
if (AESL_DEBUG_TRACE)
printf("\n  %%..1 = select i1 %%40, i16 %%35, i16 %%., !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e__2e_1_count);
  llvm_cbe__2e__2e_1 = (unsigned short )(((((signed short )llvm_cbe_tmp__32) < ((signed short )llvm_cbe__2e_))) ? ((unsigned short )llvm_cbe_tmp__32) : ((unsigned short )llvm_cbe__2e_));
if (AESL_DEBUG_TRACE)
printf("\n..1 = 0x%X\n", llvm_cbe__2e__2e_1);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge23..2 = select i1 %%41, i16 3, i16 %%storemerge23..1, !dbg !13 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge23_2e__2e_2_count);
  llvm_cbe_storemerge23_2e__2e_2 = (unsigned short )(((((signed short )llvm_cbe_tmp__35) < ((signed short )llvm_cbe__2e__2e_1))) ? ((unsigned short )((unsigned short )3)) : ((unsigned short )llvm_cbe_storemerge23_2e__2e_1));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge23..2 = 0x%X\n", llvm_cbe_storemerge23_2e__2e_2);
  if (((llvm_cbe_storemerge23_2e__2e_2&65535U) == (((unsigned short )0)&65535U))) {
    goto llvm_cbe__2e_thread;
  } else {
    goto llvm_cbe_tmp__73;
  }

llvm_cbe__2e_thread34_2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = phi i32 [ %%22, %%.thread34 ], [ %%22, %%53 ], [ %%22, %%.thread35 ], [ %%22, %%47 ], [ %%44, %%.thread  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_371_count);
  llvm_cbe_tmp__41 = (unsigned int )llvm_cbe_tmp__41__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__41);
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",llvm_cbe_tmp__37);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = add i16 %%storemerge2158, 1, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_372_count);
  llvm_cbe_tmp__42 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge2158&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__42&65535ull)));
  if (((llvm_cbe_tmp__42&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__71;
  } else {
    llvm_cbe_storemerge2158__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__42;   /* for PHI node */
    llvm_cbe_tmp__18__PHI_TEMPORARY = (unsigned short )llvm_cbe_storemerge23_2e__2e_2;   /* for PHI node */
    llvm_cbe_tmp__19__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__41;   /* for PHI node */
    goto llvm_cbe_tmp__70;
  }

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum27 = add i32 %%23, %%19, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum27_count);
  llvm_cbe__2e_sum27 = (unsigned int )((unsigned int )(llvm_cbe_tmp__20&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__17&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum27 = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum27&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds [65536 x i16]* %%1, i32 0, i32 %%.sum27, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_348_count);
  llvm_cbe_tmp__36 = (signed short *)(&llvm_cbe_tmp__1[(((signed int )llvm_cbe__2e_sum27))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum27 = 0x%X",((signed int )llvm_cbe__2e_sum27));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum27) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%25, i16* %%43, align 2, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_349_count);
  *llvm_cbe_tmp__36 = llvm_cbe_tmp__22;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = add nsw i32 %%22, 1, !dbg !8 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_350_count);
  llvm_cbe_tmp__37 = (unsigned int )((unsigned int )(llvm_cbe_tmp__19&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__37&4294967295ull)));
  llvm_cbe_tmp__41__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__37;   /* for PHI node */
  goto llvm_cbe__2e_thread34_2e_thread;

llvm_cbe_tmp__74:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum26 = add i32 %%23, %%19, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum26_count);
  llvm_cbe__2e_sum26 = (unsigned int )((unsigned int )(llvm_cbe_tmp__20&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__17&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum26 = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum26&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr inbounds [65536 x i16]* %%2, i32 0, i32 %%.sum26, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_358_count);
  llvm_cbe_tmp__38 = (signed short *)(&llvm_cbe_tmp__2[(((signed int )llvm_cbe__2e_sum26))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum26 = 0x%X",((signed int )llvm_cbe__2e_sum26));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum26) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%25, i16* %%48, align 2, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_359_count);
  *llvm_cbe_tmp__38 = llvm_cbe_tmp__22;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
  llvm_cbe_tmp__41__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__19;   /* for PHI node */
  goto llvm_cbe__2e_thread34_2e_thread;

llvm_cbe_tmp__73:
  if (((llvm_cbe_storemerge23_2e__2e_2&65535U) == (((unsigned short )1)&65535U))) {
    goto llvm_cbe_tmp__74;
  } else {
    goto llvm_cbe_tmp__75;
  }

llvm_cbe__2e_thread35:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum25 = add i32 %%23, %%19, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum25_count);
  llvm_cbe__2e_sum25 = (unsigned int )((unsigned int )(llvm_cbe_tmp__20&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__17&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum25 = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum25&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = getelementptr inbounds [65536 x i16]* %%3, i32 0, i32 %%.sum25, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_363_count);
  llvm_cbe_tmp__39 = (signed short *)(&llvm_cbe_tmp__3[(((signed int )llvm_cbe__2e_sum25))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum25 = 0x%X",((signed int )llvm_cbe__2e_sum25));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum25) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%25, i16* %%51, align 2, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_364_count);
  *llvm_cbe_tmp__39 = llvm_cbe_tmp__22;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
  llvm_cbe_tmp__41__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__19;   /* for PHI node */
  goto llvm_cbe__2e_thread34_2e_thread;

llvm_cbe_tmp__75:
  if (((llvm_cbe_storemerge23_2e__2e_2&65535U) == (((unsigned short )2)&65535U))) {
    goto llvm_cbe__2e_thread35;
  } else {
    goto llvm_cbe__2e_thread34;
  }

llvm_cbe__2e_thread34:
  if (((llvm_cbe_storemerge23_2e__2e_2&65535U) == (((unsigned short )3)&65535U))) {
    goto llvm_cbe_tmp__76;
  } else {
    llvm_cbe_tmp__41__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__19;   /* for PHI node */
    goto llvm_cbe__2e_thread34_2e_thread;
  }

llvm_cbe_tmp__76:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum24 = add i32 %%23, %%19, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum24_count);
  llvm_cbe__2e_sum24 = (unsigned int )((unsigned int )(llvm_cbe_tmp__20&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__17&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum24 = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum24&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = getelementptr inbounds [65536 x i16]* %%4, i32 0, i32 %%.sum24, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_368_count);
  llvm_cbe_tmp__40 = (signed short *)(&llvm_cbe_tmp__4[(((signed int )llvm_cbe__2e_sum24))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum24 = 0x%X",((signed int )llvm_cbe__2e_sum24));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum24) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%25, i16* %%54, align 2, !dbg !12 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_369_count);
  *llvm_cbe_tmp__40 = llvm_cbe_tmp__22;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
  llvm_cbe_tmp__41__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__19;   /* for PHI node */
  goto llvm_cbe__2e_thread34_2e_thread;

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader52' */
llvm_cbe_tmp__72:
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str, i32 0, i32 0), i32 %%55) nounwind, !dbg !8 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_392_count);
  printf(( char *)((&aesl_internal__OC_str[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__41);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__44);
}
  llvm_cbe_storemerge248__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  goto llvm_cbe__2e_preheader43;

  do {     /* Syntactic loop '.preheader43' to make GCC happy */
llvm_cbe__2e_preheader43:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge248 = phi i16 [ 0, %%59 ], [ %%64, %%63  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge248_count);
  llvm_cbe_storemerge248 = (unsigned short )llvm_cbe_storemerge248__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge248 = 0x%X",llvm_cbe_storemerge248);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__46);
}
  llvm_cbe_storemerge1647__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  goto llvm_cbe_tmp__77;

llvm_cbe_tmp__78:
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = add i16 %%storemerge248, 1, !dbg !14 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_417_count);
  llvm_cbe_tmp__46 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge248&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__46&65535ull)));
  if (((llvm_cbe_tmp__46&65535U) == (((unsigned short )256)&65535U))) {
    llvm_cbe_storemerge342__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge248__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__46;   /* for PHI node */
    goto llvm_cbe__2e_preheader43;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__77:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1647 = phi i16 [ 0, %%.preheader43 ], [ %%62, %%61  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge1647_count);
  llvm_cbe_storemerge1647 = (unsigned short )llvm_cbe_storemerge1647__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1647 = 0x%X",llvm_cbe_storemerge1647);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__45);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = add i16 %%storemerge1647, 1, !dbg !14 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_408_count);
  llvm_cbe_tmp__45 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge1647&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__45&65535ull)));
  if (((llvm_cbe_tmp__45&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__78;
  } else {
    llvm_cbe_storemerge1647__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__45;   /* for PHI node */
    goto llvm_cbe_tmp__77;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader43' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge342 = phi i16 [ %%99, %%98 ], [ 0, %%63  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge342_count);
  llvm_cbe_storemerge342 = (unsigned short )llvm_cbe_storemerge342__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge342 = 0x%X",llvm_cbe_storemerge342);
printf("\n = 0x%X",llvm_cbe_tmp__67);
printf("\n = 0x%X",((unsigned short )0));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = sext i16 %%storemerge342 to i32, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_441_count);
  llvm_cbe_tmp__47 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge342);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__47);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = shl nsw i32 %%65, 8, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_442_count);
  llvm_cbe_tmp__48 = (unsigned int )llvm_cbe_tmp__47 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
  llvm_cbe_storemerge440__PHI_TEMPORARY = (unsigned short )((unsigned short )0);   /* for PHI node */
  goto llvm_cbe_tmp__79;

llvm_cbe_tmp__80:
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = add i16 %%storemerge342, 1, !dbg !16 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_496_count);
  llvm_cbe_tmp__67 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge342&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__67&65535ull)));
  if (((llvm_cbe_tmp__67&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__81;
  } else {
    llvm_cbe_storemerge342__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__67;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__79:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge440 = phi i16 [ 0, %%.preheader ], [ %%97, %%88  for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_storemerge440_count);
  llvm_cbe_storemerge440 = (unsigned short )llvm_cbe_storemerge440__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge440 = 0x%X",llvm_cbe_storemerge440);
printf("\n = 0x%X",((unsigned short )0));
printf("\n = 0x%X",llvm_cbe_tmp__66);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = sext i16 %%storemerge440 to i32, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_444_count);
  llvm_cbe_tmp__49 = (unsigned int )((signed int )(signed short )llvm_cbe_storemerge440);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__49);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i32 %%68, %%66, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned int )((unsigned int )(llvm_cbe_tmp__49&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__48&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%X\n", ((unsigned int )(llvm_cbe__2e_sum&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = getelementptr inbounds [65536 x i16]* %%1, i32 0, i32 %%.sum, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_445_count);
  llvm_cbe_tmp__50 = (signed short *)(&llvm_cbe_tmp__1[(((signed int )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%X",((signed int )llvm_cbe__2e_sum));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = load i16* %%69, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_446_count);
  llvm_cbe_tmp__51 = (unsigned short )*llvm_cbe_tmp__50;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
  if ((((signed short )llvm_cbe_tmp__51) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_tmp__82;
  } else {
    goto llvm_cbe_tmp__83;
  }

llvm_cbe_tmp__84:

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = load i16* %%69, align 2, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_469_count);
  llvm_cbe_tmp__58 = (unsigned short )*llvm_cbe_tmp__50;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = load i16* %%74, align 2, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_470_count);
  llvm_cbe_tmp__59 = (unsigned short )*llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = load i16* %%79, align 2, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_471_count);
  llvm_cbe_tmp__60 = (unsigned short )*llvm_cbe_tmp__54;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = load i16* %%84, align 2, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_472_count);
  llvm_cbe_tmp__61 = (unsigned short )*llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__61);
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = add i16 %%90, %%89, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_473_count);
  llvm_cbe_tmp__62 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_tmp__59&65535ull)) + ((unsigned short )(llvm_cbe_tmp__58&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__62&65535ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = add i16 %%93, %%91, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_474_count);
  llvm_cbe_tmp__63 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_tmp__62&65535ull)) + ((unsigned short )(llvm_cbe_tmp__60&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__63&65535ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = add i16 %%94, %%92, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_475_count);
  llvm_cbe_tmp__64 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_tmp__63&65535ull)) + ((unsigned short )(llvm_cbe_tmp__61&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__64&65535ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = getelementptr inbounds [256 x i16]* %%final, i32 %%65, i32 %%68, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_476_count);
  llvm_cbe_tmp__65 = (signed short *)(&llvm_cbe_final[(((signed int )llvm_cbe_tmp__47))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__49))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__47));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__49));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_tmp__49) < 256 && "Write access out of array 'final' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%95, i16* %%96, align 2, !dbg !4 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_477_count);
  *llvm_cbe_tmp__65 = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = add i16 %%storemerge440, 1, !dbg !16 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_478_count);
  llvm_cbe_tmp__66 = (unsigned short )((unsigned short )(((unsigned short )(llvm_cbe_storemerge440&65535ull)) + ((unsigned short )(((unsigned short )1)&65535ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )(llvm_cbe_tmp__66&65535ull)));
  if (((llvm_cbe_tmp__66&65535U) == (((unsigned short )256)&65535U))) {
    goto llvm_cbe_tmp__80;
  } else {
    llvm_cbe_storemerge440__PHI_TEMPORARY = (unsigned short )llvm_cbe_tmp__66;   /* for PHI node */
    goto llvm_cbe_tmp__79;
  }

llvm_cbe_tmp__85:
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = getelementptr inbounds [65536 x i16]* %%4, i32 0, i32 %%.sum, !dbg !16 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_463_count);
  llvm_cbe_tmp__56 = (signed short *)(&llvm_cbe_tmp__4[(((signed int )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%X",((signed int )llvm_cbe__2e_sum));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load i16* %%84, align 2, !dbg !16 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_464_count);
  llvm_cbe_tmp__57 = (unsigned short )*llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__57);
  if ((((signed short )llvm_cbe_tmp__57) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_tmp__86;
  } else {
    goto llvm_cbe_tmp__84;
  }

llvm_cbe_tmp__87:
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = getelementptr inbounds [65536 x i16]* %%3, i32 0, i32 %%.sum, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_457_count);
  llvm_cbe_tmp__54 = (signed short *)(&llvm_cbe_tmp__3[(((signed int )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%X",((signed int )llvm_cbe__2e_sum));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = load i16* %%79, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_458_count);
  llvm_cbe_tmp__55 = (unsigned short )*llvm_cbe_tmp__54;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
  if ((((signed short )llvm_cbe_tmp__55) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_tmp__88;
  } else {
    goto llvm_cbe_tmp__85;
  }

llvm_cbe_tmp__83:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = getelementptr inbounds [65536 x i16]* %%2, i32 0, i32 %%.sum, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_451_count);
  llvm_cbe_tmp__52 = (signed short *)(&llvm_cbe_tmp__2[(((signed int )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 65536
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%X",((signed int )llvm_cbe__2e_sum));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe__2e_sum) < 65536)) fprintf(stderr, "%s:%d: warning: Read access out of array '' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = load i16* %%74, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_452_count);
  llvm_cbe_tmp__53 = (unsigned short )*llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__53);
  if ((((signed short )llvm_cbe_tmp__53) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_tmp__89;
  } else {
    goto llvm_cbe_tmp__87;
  }

llvm_cbe_tmp__82:

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 50, i16* %%69, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_449_count);
  *llvm_cbe_tmp__50 = ((unsigned short )50);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )50));
  goto llvm_cbe_tmp__83;

llvm_cbe_tmp__89:

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 70, i16* %%74, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_455_count);
  *llvm_cbe_tmp__52 = ((unsigned short )70);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )70));
  goto llvm_cbe_tmp__87;

llvm_cbe_tmp__88:

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 40, i16* %%79, align 2, !dbg !15 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_461_count);
  *llvm_cbe_tmp__54 = ((unsigned short )40);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )40));
  goto llvm_cbe_tmp__85;

llvm_cbe_tmp__86:

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe__2e_sum) < 65536 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i16 220, i16* %%84, align 2, !dbg !16 for 0x%I64xth hint within @kmeans  --> \n", ++aesl_llvm_cbe_467_count);
  *llvm_cbe_tmp__56 = ((unsigned short )220);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned short )220));
  goto llvm_cbe_tmp__84;

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__81:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @kmeans}\n");
  return;
}

