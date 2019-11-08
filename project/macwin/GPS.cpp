#include <stdio.h>

#if defined(HX_WINDOWS)
#else
namespace SayGPS{
#endif

	void Say(const char *TheText)
	{
			printf("GPS World 1\n");
			printf("GPS World 2\n");
			printf("GPS World 3 : The Text : %s\n", TheText);
			printf("GPS World 4\n");
			printf("GPS World 5\n");
	}
#if defined(HX_WINDOWS)
#else
}// namespace
#endif


