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

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void sobel(signed int (*llvm_cbe_input_image)[256], signed int (*llvm_cbe_output_image)[256]);


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

void sobel(signed int (*llvm_cbe_input_image)[256], signed int (*llvm_cbe_output_image)[256]) {
  static  unsigned long long aesl_llvm_cbe_image_count = 0;
  signed int llvm_cbe_image[256][256];    /* Address-exposed local */
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
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_storemerge27_count = 0;
  unsigned int llvm_cbe_storemerge27;
  unsigned int llvm_cbe_storemerge27__PHI_TEMPORARY;
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
  static  unsigned long long aesl_llvm_cbe_or_2e_cond_count = 0;
  bool llvm_cbe_or_2e_cond;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  unsigned int llvm_cbe_tmp__3;
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
  static  unsigned long long aesl_llvm_cbe_exitcond32_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  signed int *llvm_cbe_tmp__4;
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
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge526_2e_us_count = 0;
  unsigned int llvm_cbe_storemerge526_2e_us;
  unsigned int llvm_cbe_storemerge526_2e_us__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_or_2e_cond8_2e_us_count = 0;
  bool llvm_cbe_or_2e_cond8_2e_us;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  signed int *llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  signed int *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  signed int *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  signed int *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  unsigned int llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  unsigned int llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  signed int *llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  signed int *llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  unsigned int llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_ispos_2e_us_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg_2e_us_count = 0;
  unsigned int llvm_cbe_neg_2e_us;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_ispos9_2e_us_count = 0;
  static  unsigned long long aesl_llvm_cbe_neg10_2e_us_count = 0;
  unsigned int llvm_cbe_neg10_2e_us;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  signed int *llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  signed int *llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  signed int *llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  signed int *llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge526_count = 0;
  unsigned int llvm_cbe_storemerge526;
  unsigned int llvm_cbe_storemerge526__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  signed int *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  signed int *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_exitcond33_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_exitcond34_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  signed int *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_storemerge124_count = 0;
  unsigned int llvm_cbe_storemerge124;
  unsigned int llvm_cbe_storemerge124__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  unsigned int llvm_cbe_tmp__53;
  unsigned int llvm_cbe_tmp__53__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  unsigned int llvm_cbe_tmp__54;
  unsigned int llvm_cbe_tmp__54__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge421_count = 0;
  unsigned int llvm_cbe_storemerge421;
  unsigned int llvm_cbe_storemerge421__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  unsigned int llvm_cbe_tmp__56;
  unsigned int llvm_cbe_tmp__56__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  unsigned int llvm_cbe_tmp__57;
  unsigned int llvm_cbe_tmp__57__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  signed int *llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  unsigned int llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond30_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  unsigned int llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond31_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge218_count = 0;
  unsigned int llvm_cbe_storemerge218;
  unsigned int llvm_cbe_storemerge218__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge316_count = 0;
  unsigned int llvm_cbe_storemerge316;
  unsigned int llvm_cbe_storemerge316__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  signed int *llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  unsigned int llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  signed int *llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  unsigned int llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond29_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @sobel\n");
  llvm_cbe_storemerge27__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader25;

  do {     /* Syntactic loop '.preheader25' to make GCC happy */
llvm_cbe__2e_preheader25:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge27 = phi i32 [ 0, %%0 ], [ %%4, %%74  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge27_count);
  llvm_cbe_storemerge27 = (unsigned int )llvm_cbe_storemerge27__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",llvm_cbe_storemerge27);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond = and i1 %%1, %%2, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_or_2e_cond_count);
  llvm_cbe_or_2e_cond = (bool )(((((signed int )llvm_cbe_storemerge27) > ((signed int )0u)) & (((signed int )llvm_cbe_storemerge27) < ((signed int )255u)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond = 0x%X\n", llvm_cbe_or_2e_cond);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = add nsw i32 %%storemerge27, -1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_92_count);
  llvm_cbe_tmp__1 = (unsigned int )((unsigned int )(llvm_cbe_storemerge27&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__1&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = add nsw i32 %%storemerge27, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_93_count);
  llvm_cbe_tmp__2 = (unsigned int )((unsigned int )(llvm_cbe_storemerge27&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__2&4294967295ull)));
  if (llvm_cbe_or_2e_cond) {
    llvm_cbe_storemerge526_2e_us__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader25_2e_split_2e_us;
  } else {
    llvm_cbe_storemerge526__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__70;
  }

llvm_cbe_tmp__71:
  if (((llvm_cbe_tmp__2&4294967295U) == (256u&4294967295U))) {
    goto llvm_cbe_tmp__72;
  } else {
    llvm_cbe_storemerge27__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__2;   /* for PHI node */
    goto llvm_cbe__2e_preheader25;
  }

llvm_cbe__2e_us_2d_lcssa_2e_us:
  goto llvm_cbe_tmp__71;

  do {     /* Syntactic loop '.preheader25.split.us' to make GCC happy */
llvm_cbe__2e_preheader25_2e_split_2e_us:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge526.us = phi i32 [ %%8, %%7 ], [ 0, %%.preheader25 ], [ %%59, %%.thread37  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge526_2e_us_count);
  llvm_cbe_storemerge526_2e_us = (unsigned int )llvm_cbe_storemerge526_2e_us__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526.us = 0x%X",llvm_cbe_storemerge526_2e_us);
printf("\n = 0x%X",llvm_cbe_tmp__3);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__44);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond8.us = and i1 %%16, %%17, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_or_2e_cond8_2e_us_count);
  llvm_cbe_or_2e_cond8_2e_us = (bool )(((((signed int )llvm_cbe_storemerge526_2e_us) > ((signed int )0u)) & (((signed int )llvm_cbe_storemerge526_2e_us) < ((signed int )255u)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond8.us = 0x%X\n", llvm_cbe_or_2e_cond8_2e_us);
  if (llvm_cbe_or_2e_cond8_2e_us) {
    goto llvm_cbe_tmp__73;
  } else {
    goto llvm_cbe_tmp__74;
  }

llvm_cbe_tmp__75:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge526.us, 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_97_count);
  llvm_cbe_tmp__3 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__3&4294967295ull)));
  if (((llvm_cbe_tmp__3&4294967295U) == (256u&4294967295U))) {
    goto llvm_cbe__2e_us_2d_lcssa_2e_us;
  } else {
    llvm_cbe_storemerge526_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__3;   /* for PHI node */
    goto llvm_cbe__2e_preheader25_2e_split_2e_us;
  }

llvm_cbe_tmp__76:
  if (((llvm_cbe_storemerge526_2e_us&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe__2e_thread35;
  } else {
    goto llvm_cbe_tmp__75;
  }

llvm_cbe_tmp__77:
  if (((llvm_cbe_storemerge526_2e_us&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_thread37;
  } else {
    goto llvm_cbe_tmp__76;
  }

llvm_cbe_tmp__78:
  if (((llvm_cbe_storemerge27&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__79;
  } else {
    goto llvm_cbe_tmp__77;
  }

llvm_cbe_tmp__74:
  if (((llvm_cbe_storemerge27&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_thread_2e_us;
  } else {
    goto llvm_cbe_tmp__78;
  }

llvm_cbe_tmp__73:
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = add nsw i32 %%storemerge526.us, -1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__5 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526_2e_us&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__5&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%3, i32 %%19, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_172_count);
  llvm_cbe_tmp__6 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__1))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__5))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__1));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__5));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__5) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i32* %%20, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_173_count);
  llvm_cbe_tmp__7 = (unsigned int )*llvm_cbe_tmp__6;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add nsw i32 %%storemerge526.us, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_174_count);
  llvm_cbe_tmp__8 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__8&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%3, i32 %%22, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_175_count);
  llvm_cbe_tmp__9 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__1))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__1));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__8));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__8) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i32* %%23, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_176_count);
  llvm_cbe_tmp__10 = (unsigned int )*llvm_cbe_tmp__9;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%storemerge27, i32 %%19, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_177_count);
  llvm_cbe_tmp__11 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__5))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__5));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__5) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* %%25, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__12 = (unsigned int )*llvm_cbe_tmp__11;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = shl nsw i32 %%26, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__13 = (unsigned int )llvm_cbe_tmp__12 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%storemerge27, i32 %%22, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__14 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__8));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__8) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = load i32* %%28, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_181_count);
  llvm_cbe_tmp__15 = (unsigned int )*llvm_cbe_tmp__14;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = shl i32 %%29, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_182_count);
  llvm_cbe_tmp__16 = (unsigned int )llvm_cbe_tmp__15 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%4, i32 %%19, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_183_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__2))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__5))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__2));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__5));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__5) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i32* %%31, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_184_count);
  llvm_cbe_tmp__18 = (unsigned int )*llvm_cbe_tmp__17;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%4, i32 %%22, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_185_count);
  llvm_cbe_tmp__19 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__2))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__2));
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__8));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_tmp__8) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* %%33, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_186_count);
  llvm_cbe_tmp__20 = (unsigned int )*llvm_cbe_tmp__19;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = sub i32 %%24, %%21, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_187_count);
  llvm_cbe_tmp__21 = (unsigned int )((unsigned int )(llvm_cbe_tmp__10&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__7&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__21&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = sub i32 %%35, %%27, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_188_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_tmp__21&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__13&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add i32 %%36, %%30, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_189_count);
  llvm_cbe_tmp__23 = (unsigned int )((unsigned int )(llvm_cbe_tmp__22&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__16&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__23&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = sub i32 %%37, %%32, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_190_count);
  llvm_cbe_tmp__24 = (unsigned int )((unsigned int )(llvm_cbe_tmp__23&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__18&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__24&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = add i32 %%38, %%34, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_191_count);
  llvm_cbe_tmp__25 = (unsigned int )((unsigned int )(llvm_cbe_tmp__24&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__20&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__25&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%3, i32 %%storemerge526.us, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_194_count);
  llvm_cbe_tmp__26 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__1))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge526_2e_us))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__1));
printf("\nstoremerge526.us = 0x%X",((signed int )llvm_cbe_storemerge526_2e_us));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge526_2e_us) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = load i32* %%40, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_195_count);
  llvm_cbe_tmp__27 = (unsigned int )*llvm_cbe_tmp__26;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = shl i32 %%41, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_196_count);
  llvm_cbe_tmp__28 = (unsigned int )llvm_cbe_tmp__27 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds [256 x i32]* %%input_image, i32 %%4, i32 %%storemerge526.us, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__29 = (signed int *)(&llvm_cbe_input_image[(((signed int )llvm_cbe_tmp__2))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge526_2e_us))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__2));
printf("\nstoremerge526.us = 0x%X",((signed int )llvm_cbe_storemerge526_2e_us));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge526_2e_us) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'input_image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = load i32* %%43, align 4, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_198_count);
  llvm_cbe_tmp__30 = (unsigned int )*llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = shl nsw i32 %%44, 1, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_199_count);
  llvm_cbe_tmp__31 = (unsigned int )llvm_cbe_tmp__30 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = add i32 %%24, %%21, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_200_count);
  llvm_cbe_tmp__32 = (unsigned int )((unsigned int )(llvm_cbe_tmp__10&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__7&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__32&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = sub i32 %%46, %%32, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_201_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(llvm_cbe_tmp__32&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__18&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__33&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = sub i32 %%47, %%34, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_202_count);
  llvm_cbe_tmp__34 = (unsigned int )((unsigned int )(llvm_cbe_tmp__33&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__20&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__34&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = add i32 %%48, %%42, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_203_count);
  llvm_cbe_tmp__35 = (unsigned int )((unsigned int )(llvm_cbe_tmp__34&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__28&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__35&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = sub i32 %%49, %%45, !dbg !3 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(llvm_cbe_tmp__35&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__31&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__36&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%neg.us = sub i32 0, %%39, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_neg_2e_us_count);
  llvm_cbe_neg_2e_us = (unsigned int )-(llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\nneg.us = 0x%X\n", ((unsigned int )(llvm_cbe_neg_2e_us&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = select i1 %%ispos.us, i32 %%39, i32 %%neg.us, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_206_count);
  llvm_cbe_tmp__37 = (unsigned int )(((((signed int )llvm_cbe_tmp__25) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__25) : ((unsigned int )llvm_cbe_neg_2e_us));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__37);
if (AESL_DEBUG_TRACE)
printf("\n  %%neg10.us = sub i32 0, %%50, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_neg10_2e_us_count);
  llvm_cbe_neg10_2e_us = (unsigned int )-(llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\nneg10.us = 0x%X\n", ((unsigned int )(llvm_cbe_neg10_2e_us&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = select i1 %%ispos9.us, i32 %%50, i32 %%neg10.us, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_208_count);
  llvm_cbe_tmp__38 = (unsigned int )(((((signed int )llvm_cbe_tmp__36) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_tmp__36) : ((unsigned int )llvm_cbe_neg10_2e_us));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = add nsw i32 %%52, %%51, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_209_count);
  llvm_cbe_tmp__39 = (unsigned int )((unsigned int )(llvm_cbe_tmp__38&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__37&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__39&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = getelementptr inbounds [256 x [256 x i32]]* %%image, i32 0, i32 %%storemerge27, i32 %%storemerge526.us, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_212_count);
  llvm_cbe_tmp__40 = (signed int *)(&llvm_cbe_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge526_2e_us))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
printf("\nstoremerge526.us = 0x%X",((signed int )llvm_cbe_storemerge526_2e_us));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge27) < 256 && "Write access out of array 'image' bound?");
  assert(((signed int )llvm_cbe_storemerge526_2e_us) < 256 && "Write access out of array 'image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%53, i32* %%54, align 4, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_213_count);
  *llvm_cbe_tmp__40 = llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
  goto llvm_cbe_tmp__74;

llvm_cbe_tmp__79:
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = getelementptr inbounds [256 x i32]* %%output_image, i32 255, i32 %%storemerge526.us, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_215_count);
  llvm_cbe_tmp__41 = (signed int *)(&llvm_cbe_output_image[(((signed int )255u))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge526_2e_us))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526.us = 0x%X",((signed int )llvm_cbe_storemerge526_2e_us));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge526_2e_us) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%56, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_216_count);
  *llvm_cbe_tmp__41 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__77;

llvm_cbe__2e_thread_2e_us:
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = getelementptr inbounds [256 x i32]* %%output_image, i32 0, i32 %%storemerge526.us, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_218_count);
  llvm_cbe_tmp__42 = (signed int *)(&(*llvm_cbe_output_image)[(((signed int )llvm_cbe_storemerge526_2e_us))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526.us = 0x%X",((signed int )llvm_cbe_storemerge526_2e_us));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge526_2e_us) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%57, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_219_count);
  *llvm_cbe_tmp__42 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__77;

llvm_cbe__2e_thread37:
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = getelementptr inbounds [256 x i32]* %%output_image, i32 %%storemerge27, i32 0, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_221_count);
  llvm_cbe_tmp__43 = (signed int *)(&llvm_cbe_output_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )0u))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
}

#ifdef AESL_BC_SIM
  assert(((signed int )0u) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%58, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_222_count);
  *llvm_cbe_tmp__43 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add nsw i32 %%storemerge526.us, 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__44 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__44&4294967295ull)));
  llvm_cbe_storemerge526_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__44;   /* for PHI node */
  goto llvm_cbe__2e_preheader25_2e_split_2e_us;

  } while (1); /* end of syntactic loop '.preheader25.split.us' */
llvm_cbe__2e_thread35:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [256 x i32]* %%output_image, i32 %%storemerge27, i32 255, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_129_count);
  llvm_cbe_tmp__4 = (signed int *)(&llvm_cbe_output_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )255u))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
}

#ifdef AESL_BC_SIM
  assert(((signed int )255u) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%9, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_130_count);
  *llvm_cbe_tmp__4 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe__2e_us_2d_lcssa_2e_us;

llvm_cbe__2e_us_2d_lcssa:
  goto llvm_cbe_tmp__71;

llvm_cbe__2e_thread39:
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = getelementptr inbounds [256 x i32]* %%output_image, i32 %%storemerge27, i32 255, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_272_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_output_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )255u))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
}

#ifdef AESL_BC_SIM
  assert(((signed int )255u) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%71, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_273_count);
  *llvm_cbe_tmp__49 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe__2e_us_2d_lcssa;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__70:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge526 = phi i32 [ %%73, %%72 ], [ 0, %%.preheader25 ], [ %%68, %%.thread41  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge526_count);
  llvm_cbe_storemerge526 = (unsigned int )llvm_cbe_storemerge526__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526 = 0x%X",llvm_cbe_storemerge526);
printf("\n = 0x%X",llvm_cbe_tmp__50);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__48);
}
  if (((llvm_cbe_storemerge27&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_thread;
  } else {
    goto llvm_cbe_tmp__80;
  }

llvm_cbe__2e_thread41:
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = getelementptr inbounds [256 x i32]* %%output_image, i32 %%storemerge27, i32 0, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_266_count);
  llvm_cbe_tmp__47 = (signed int *)(&llvm_cbe_output_image[(((signed int )llvm_cbe_storemerge27))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )0u))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge27 = 0x%X",((signed int )llvm_cbe_storemerge27));
}

#ifdef AESL_BC_SIM
  assert(((signed int )0u) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%67, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_267_count);
  *llvm_cbe_tmp__47 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = add nsw i32 %%storemerge526, 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__48 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__48&4294967295ull)));
  llvm_cbe_storemerge526__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__48;   /* for PHI node */
  goto llvm_cbe_tmp__70;

llvm_cbe_tmp__81:
  if (((llvm_cbe_storemerge526&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_thread41;
  } else {
    goto llvm_cbe_tmp__82;
  }

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = getelementptr inbounds [256 x i32]* %%output_image, i32 0, i32 %%storemerge526, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_257_count);
  llvm_cbe_tmp__45 = (signed int *)(&(*llvm_cbe_output_image)[(((signed int )llvm_cbe_storemerge526))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526 = 0x%X",((signed int )llvm_cbe_storemerge526));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge526) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%61, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_258_count);
  *llvm_cbe_tmp__45 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__81;

llvm_cbe_tmp__80:
  if (((llvm_cbe_storemerge27&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__83;
  } else {
    goto llvm_cbe_tmp__81;
  }

llvm_cbe_tmp__83:
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds [256 x i32]* %%output_image, i32 255, i32 %%storemerge526, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__46 = (signed int *)(&llvm_cbe_output_image[(((signed int )255u))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge526))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge526 = 0x%X",((signed int )llvm_cbe_storemerge526));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge526) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%64, align 4, !dbg !4 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_262_count);
  *llvm_cbe_tmp__46 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__81;

llvm_cbe_tmp__84:
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = add nsw i32 %%storemerge526, 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_275_count);
  llvm_cbe_tmp__50 = (unsigned int )((unsigned int )(llvm_cbe_storemerge526&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__50&4294967295ull)));
  if (((llvm_cbe_tmp__50&4294967295U) == (256u&4294967295U))) {
    goto llvm_cbe__2e_us_2d_lcssa;
  } else {
    llvm_cbe_storemerge526__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__50;   /* for PHI node */
    goto llvm_cbe_tmp__70;
  }

llvm_cbe_tmp__82:
  if (((llvm_cbe_storemerge526&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe__2e_thread39;
  } else {
    goto llvm_cbe_tmp__84;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader25' */
llvm_cbe_tmp__72:
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds [256 x [256 x i32]]* %%image, i32 0, i32 1, i32 1, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_309_count);
  llvm_cbe_tmp__51 = (signed int *)(&llvm_cbe_image[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )1u))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);
  if (!(((signed int )1u) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i32* %%76, align 4, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_310_count);
  llvm_cbe_tmp__52 = (unsigned int )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
  llvm_cbe_storemerge124__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__53__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__52;   /* for PHI node */
  llvm_cbe_tmp__54__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__52;   /* for PHI node */
  goto llvm_cbe__2e_preheader19;

  do {     /* Syntactic loop '.preheader19' to make GCC happy */
llvm_cbe__2e_preheader19:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge124 = phi i32 [ 1, %%75 ], [ %%91, %%90  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge124_count);
  llvm_cbe_storemerge124 = (unsigned int )llvm_cbe_storemerge124__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge124 = 0x%X",llvm_cbe_storemerge124);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__62);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = phi i32 [ %%77, %%75 ], [ %%., %%90  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_325_count);
  llvm_cbe_tmp__53 = (unsigned int )llvm_cbe_tmp__53__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__53);
printf("\n = 0x%X",llvm_cbe_tmp__52);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = phi i32 [ %%77, %%75 ], [ %%88, %%90  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_326_count);
  llvm_cbe_tmp__54 = (unsigned int )llvm_cbe_tmp__54__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__54);
printf("\n = 0x%X",llvm_cbe_tmp__52);
printf("\n = 0x%X",llvm_cbe_tmp__60);
}
  llvm_cbe_storemerge421__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__56__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__53;   /* for PHI node */
  llvm_cbe_tmp__57__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__54;   /* for PHI node */
  goto llvm_cbe_tmp__85;

llvm_cbe_tmp__86:
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = add nsw i32 %%storemerge124, 1, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_363_count);
  llvm_cbe_tmp__62 = (unsigned int )((unsigned int )(llvm_cbe_storemerge124&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__62&4294967295ull)));
  if (((llvm_cbe_tmp__62&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe__2e_preheader17;
  } else {
    llvm_cbe_storemerge124__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__62;   /* for PHI node */
    llvm_cbe_tmp__53__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    llvm_cbe_tmp__54__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__60;   /* for PHI node */
    goto llvm_cbe__2e_preheader19;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__85:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge421 = phi i32 [ 1, %%.preheader19 ], [ %%89, %%81  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge421_count);
  llvm_cbe_storemerge421 = (unsigned int )llvm_cbe_storemerge421__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge421 = 0x%X",llvm_cbe_storemerge421);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__61);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = phi i32 [ %%78, %%.preheader19 ], [ %%., %%81  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_340_count);
  llvm_cbe_tmp__56 = (unsigned int )llvm_cbe_tmp__56__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__56);
printf("\n = 0x%X",llvm_cbe_tmp__53);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = phi i32 [ %%79, %%.preheader19 ], [ %%88, %%81  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_341_count);
  llvm_cbe_tmp__57 = (unsigned int )llvm_cbe_tmp__57__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__57);
printf("\n = 0x%X",llvm_cbe_tmp__54);
printf("\n = 0x%X",llvm_cbe_tmp__60);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = getelementptr inbounds [256 x [256 x i32]]* %%image, i32 0, i32 %%storemerge124, i32 %%storemerge421, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_342_count);
  llvm_cbe_tmp__58 = (signed int *)(&llvm_cbe_image[(((signed int )llvm_cbe_storemerge124))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge421))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge124 = 0x%X",((signed int )llvm_cbe_storemerge124));
printf("\nstoremerge421 = 0x%X",((signed int )llvm_cbe_storemerge421));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge124) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);
  if (!(((signed int )llvm_cbe_storemerge421) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load i32* %%84, align 4, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_343_count);
  llvm_cbe_tmp__59 = (unsigned int )*llvm_cbe_tmp__58;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%86, i32 %%85, i32 %%82, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__59) > ((signed int )llvm_cbe_tmp__56))) ? ((unsigned int )llvm_cbe_tmp__59) : ((unsigned int )llvm_cbe_tmp__56));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = select i1 %%87, i32 %%85, i32 %%83, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_352_count);
  llvm_cbe_tmp__60 = (unsigned int )(((((signed int )llvm_cbe_tmp__59) < ((signed int )llvm_cbe_tmp__57))) ? ((unsigned int )llvm_cbe_tmp__59) : ((unsigned int )llvm_cbe_tmp__57));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = add nsw i32 %%storemerge421, 1, !dbg !10 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_354_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(llvm_cbe_storemerge421&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
  if (((llvm_cbe_tmp__61&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__86;
  } else {
    llvm_cbe_storemerge421__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__61;   /* for PHI node */
    llvm_cbe_tmp__56__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    llvm_cbe_tmp__57__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__60;   /* for PHI node */
    goto llvm_cbe_tmp__85;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader19' */
llvm_cbe__2e_preheader17:
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = sub nsw i32 %%., %%88, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_338_count);
  llvm_cbe_tmp__55 = (unsigned int )((unsigned int )(llvm_cbe__2e_&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__60&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__55&4294967295ull)));
  llvm_cbe_storemerge218__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge218 = phi i32 [ 1, %%.preheader17 ], [ %%100, %%99  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge218_count);
  llvm_cbe_storemerge218 = (unsigned int )llvm_cbe_storemerge218__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge218 = 0x%X",llvm_cbe_storemerge218);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__69);
}
  llvm_cbe_storemerge316__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe_tmp__87;

llvm_cbe_tmp__88:
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = add nsw i32 %%storemerge218, 1, !dbg !10 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_390_count);
  llvm_cbe_tmp__69 = (unsigned int )((unsigned int )(llvm_cbe_storemerge218&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__69&4294967295ull)));
  if (((llvm_cbe_tmp__69&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__89;
  } else {
    llvm_cbe_storemerge218__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__69;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__87:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge316 = phi i32 [ 1, %%.preheader ], [ %%98, %%92  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge316_count);
  llvm_cbe_storemerge316 = (unsigned int )llvm_cbe_storemerge316__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge316 = 0x%X",llvm_cbe_storemerge316);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__68);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = getelementptr inbounds [256 x [256 x i32]]* %%image, i32 0, i32 %%storemerge218, i32 %%storemerge316, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_377_count);
  llvm_cbe_tmp__63 = (signed int *)(&llvm_cbe_image[(((signed int )llvm_cbe_storemerge218))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge316))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge218 = 0x%X",((signed int )llvm_cbe_storemerge218));
printf("\nstoremerge316 = 0x%X",((signed int )llvm_cbe_storemerge316));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge218) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);
  if (!(((signed int )llvm_cbe_storemerge316) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'image' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = load i32* %%93, align 4, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_378_count);
  llvm_cbe_tmp__64 = (unsigned int )*llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = mul nsw i32 %%94, 255, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_379_count);
  llvm_cbe_tmp__65 = (unsigned int )((unsigned int )(llvm_cbe_tmp__64&4294967295ull)) * ((unsigned int )(255u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__65&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = sdiv i32 %%95, %%80, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_380_count);
  llvm_cbe_tmp__66 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__65) / ((signed int )llvm_cbe_tmp__55)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__66));
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = getelementptr inbounds [256 x i32]* %%output_image, i32 %%storemerge218, i32 %%storemerge316, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_381_count);
  llvm_cbe_tmp__67 = (signed int *)(&llvm_cbe_output_image[(((signed int )llvm_cbe_storemerge218))
#ifdef AESL_BC_SIM
 % 256
#endif
][(((signed int )llvm_cbe_storemerge316))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge218 = 0x%X",((signed int )llvm_cbe_storemerge218));
printf("\nstoremerge316 = 0x%X",((signed int )llvm_cbe_storemerge316));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge316) < 256 && "Write access out of array 'output_image' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%96, i32* %%97, align 4, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_382_count);
  *llvm_cbe_tmp__67 = llvm_cbe_tmp__66;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = add nsw i32 %%storemerge316, 1, !dbg !10 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_383_count);
  llvm_cbe_tmp__68 = (unsigned int )((unsigned int )(llvm_cbe_storemerge316&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__68&4294967295ull)));
  if (((llvm_cbe_tmp__68&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__88;
  } else {
    llvm_cbe_storemerge316__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__68;   /* for PHI node */
    goto llvm_cbe_tmp__87;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__89:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @sobel}\n");
  return;
}

