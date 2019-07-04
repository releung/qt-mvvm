// ************************************************************************** //
//
//  Prototype of mini MVVM framework for bornagainproject.org
//
//! @homepage  http://www.bornagainproject.org
//! @license   GNU General Public License v3 or higher
//
// ************************************************************************** //

#include "standarditemcatalogue.h"
#include "mvvm_types.h"
#include "vectoritem.h"
#include "propertyitem.h"
#include "compounditem.h"

using namespace ModelView;

std::unique_ptr<ItemCatalogue> CreateStandardItemCatalogue()
{
    auto result = std::make_unique<ModelView::ItemCatalogue>();
    result->registerItem<SessionItem>();
    result->registerItem<PropertyItem>();
    result->registerItem<CompoundItem>();
    result->registerItem<VectorItem>();
    return result;
}
