//add here most rarely modified headers to speed up debug build compilation
#include "WorldSocket.h"                                    // must be first to make ACE happy with ACE includes in it
#include "Common.h"

#include "MapManager.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "ObjectDefines.h"
#include "Database/SQLStorage.h"
#include "Opcodes.h"
#include "SharedDefines.h"

#define FASTBUILD 1
#ifdef FASTBUILD
//add additional headers here to speed up compilation in release builds even more
#include "ObjectMgr.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Map.h"
#include "World.h"
#endif
