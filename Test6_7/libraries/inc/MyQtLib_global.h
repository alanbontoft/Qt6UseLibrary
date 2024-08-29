#ifndef MYQTLIB_GLOBAL_H
#define MYQTLIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(MYQTLIB_LIBRARY)
#define MYQTLIB_EXPORT Q_DECL_EXPORT
#else
#define MYQTLIB_EXPORT Q_DECL_IMPORT
#endif

#endif // MYQTLIB_GLOBAL_H
