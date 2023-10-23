#ifndef CONFIG_H
#define CONFIG_H

#ifndef __cplusplus
# define inline inline
#endif

#define HAVE_SELECT

/* #undef HAVE_POLL */
#ifdef _WIN64
	#define AMQ_PLATFORM "Windows"
#else
    #define AMQ_PLATFORM "Linux"
#endif


#endif /* CONFIG_H */
