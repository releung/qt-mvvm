// ************************************************************************** //
//
//  Prototype of mini MVVM framework for bornagainproject.org
//
//! @homepage  http://www.bornagainproject.org
//! @license   GNU General Public License v3 or higher
//
// ************************************************************************** //

#ifndef COMPARATORS_H
#define COMPARATORS_H

#include "global.h"

namespace ModelView {

//! Helper class to register variant comparators.

class CORE_EXPORT Comparators
{
public:
    static void registerComparators();
    static bool registered();

private:
    static bool m_is_registered;
};

}  // namespace ModelView

#endif
