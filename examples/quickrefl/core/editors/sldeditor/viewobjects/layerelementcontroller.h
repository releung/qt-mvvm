// ************************************************************************** //
//
//  Model-view-view-model framework for large GUI applications
//
//! @license   GNU General Public License v3 or higher (see COPYING)
//! @authors   see AUTHORS
//
// ************************************************************************** //

#ifndef LAYERELEMENTCONTROLLER_H
#define LAYERELEMENTCONTROLLER_H

#include <QObject>
#include <vector>

#include "mvvm/plotting/sceneadapterinterface.h"

class LayerElementItem;
class GraphicsScene;

class HandleElementView;
class SegmentElementView;
class RoughnessElementView;

class HandleElementItem;
class SegmentElementItem;
class RoughnessElementItem;

class LayerElementController : public QObject
{
    Q_OBJECT

public:
    LayerElementController(LayerElementItem* layer_view_item);
    LayerElementItem* layerElementItem() const;
    void connectToModel() const;
    void disconnectFormModel() const;

    void setScene(GraphicsScene* scene);
    GraphicsScene* scene() const;
    void unsetScene();

private:
    ModelView::SceneAdapterInterface* getSceneAdapter() const;

public:
    void setLayerAbove(LayerElementController* layer_view_controller);
    void setLayerBelow(LayerElementController* layer_view_controller);
    LayerElementController* layerAbove() const;
    LayerElementController* layerBelow() const;
    void unsetLayerAbove(bool silent = true);
    void unsetLayerBelow(bool silent = true);

public:
    void setSideSegment(SegmentElementView* segment_view);
    void setTopSegment(SegmentElementView* segment_view);
    SegmentElementView* sideSegment() const;
    SegmentElementView* topSegment() const;
    void unsetSideSegment();
    void unsetTopSegment();

protected:
    void updateSideSegment() const;
    void updateTopSegment() const;
    QRectF sideSegmentRect() const;
    QRectF topSegmentRect() const;
    void putSegementsOnScene() const;
    void removeSegmentsFromScene() const;

private:
    LayerElementItem* p_model_item;
    GraphicsScene* p_scene = nullptr;

    std::vector<SegmentElementView*> m_segment_views = {nullptr, nullptr};
    std::vector<HandleElementView*> m_handle_views = {nullptr, nullptr, nullptr};
    std::vector<HandleElementView*> m_rough_handles_views = {nullptr, nullptr};
    RoughnessElementView* p_roughness_view = nullptr;

    LayerElementController* p_controller_above = nullptr;
    LayerElementController* p_controller_below = nullptr;
};

#endif
