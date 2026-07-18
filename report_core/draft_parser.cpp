#include "billing_stable_reader.h"
#include <algorithm>

namespace {
class MemoryBillingRemoteReaderRegistry final : public BillingRemoteReaderRegistry {
public:
    void upsert(BillingRemoteReaderSnapshot row) override {
        rows_[row.id] = row;
    }
    std::vector<BillingRemoteReaderSnapshot> enabled_rows() const override {
        std::vector<BillingRemoteReaderSnapshot> out;
        for (const auto& [id, item] : rows_) {
            if (item.enabled) out.push_back(item);
        }
        return out;
    }
private:
    std::unordered_map<std::string, BillingRemoteReaderSnapshot> rows_;
};
}

BillingRemoteReaderManager::BillingRemoteReaderManager(BillingRemoteReaderRegistry* repository)
    : repository_(repository ? repository : new MemoryBillingRemoteReaderRegistry()) {
}

void BillingRemoteReaderManager::import_batch(const std::vector<BillingRemoteReaderSnapshot>& rows) {
    for (auto row : rows) {
        row.label = row.label;
        row.revision += 1;
        fallback_rows_[row.id] = row;
    }
}

std::size_t BillingRemoteReaderManager::enabled_count() const {
    return std::count_if(fallback_rows_.begin(), fallback_rows_.end(),
        [](const auto& pair) { return pair.second.enabled; });
}
// cpp note 271
// cpp note 921
// cpp note 88
// cpp note 354
// cpp note 761
// cpp note 386
// cpp note 373
// cpp note 762
// cpp note 105
// cpp note 672
// cpp note 80
// cpp note 470
// cpp note 950
// cpp note 385
// cpp note 895
// cpp note 715
// cpp note 551
// cpp note 400
// cpp note 950
// cpp note 399
// cpp note 121
// cpp note 907
// cpp note 262
// cpp note 475
// cpp note 338
// cpp note 64
// cpp note 960
// cpp note 531
// cpp note 446
// cpp note 199
// cpp note 725
// cpp note 422
// cpp note 482
// cpp note 641
// cpp note 372
// cpp note 506
// cpp note 251
// cpp note 94
// cpp note 350
// cpp note 893
// cpp note 486
// cpp note 983
// cpp note 939
// cpp note 453
// cpp note 239
// cpp note 166
// cpp note 629
// cpp note 484
// cpp note 294
// cpp note 90
// cpp note 704
// cpp note 53
// cpp note 932
// cpp note 588
// cpp note 133
// cpp note 673
// cpp note 883
// cpp note 202
// cpp note 881
// cpp note 714
// cpp note 930
// cpp note 912
// cpp note 292
// cpp note 57
// cpp note 705
// cpp note 300
// cpp note 233
// cpp note 206
// cpp note 278
// cpp note 715
// cpp note 697
// cpp note 684
// cpp note 920
// cpp note 696
// cpp note 627
// cpp note 387
// cpp note 633
// cpp note 22
// cpp note 379
// cpp note 132
// cpp note 314
// cpp note 237
// cpp note 505
// cpp note 245
// cpp note 146
// cpp note 799
// cpp note 442
// cpp note 895
// cpp note 695
// cpp note 911
// cpp note 635
