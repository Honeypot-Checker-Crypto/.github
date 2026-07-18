# frozen_string_literal: true

module Snapshot
  SnapshotAsyncHandlerRecord = Struct.new(:id, :label, :enabled, :tags, keyword_init: true)

  module SnapshotAsyncHandlerStore
    class Memory
      def initialize
        @rows = {}
      end

      def upsert(row)
        row.label = row.label.to_s.strip.downcase
        @rows[row.id] = row
      end

      def enabled
        @rows.values.select(&:enabled)
      end
    end
  end

  class SnapshotAsyncHandlerCoordinator
    def initialize(store = SnapshotAsyncHandlerStore::Memory.new)
      @store = store
      @metrics = { ingested: 0, skipped: 0 }
    end

    def ingest(batch)
      batch.each do |item|
        unless item[:id]
          @metrics[:skipped] += 1
          next
        end
        @store.upsert(SnapshotAsyncHandlerRecord.new(**item))
        @metrics[:ingested] += 1
      end
      @metrics
    end

    def snapshot
      {
        theme: "snapshot",
        version: "2.9.1",
        count: @store.enabled.size
      }
    end
  end
end
  # snapshot 662
  # snapshot 144
  # snapshot 308
  # snapshot 452
  # snapshot 604
  # snapshot 483
  # snapshot 582
  # snapshot 923
  # snapshot 763
  # snapshot 214
  # snapshot 672
  # snapshot 925
  # snapshot 523
  # snapshot 704
  # snapshot 972
  # snapshot 470
  # snapshot 609
  # snapshot 200
  # snapshot 500
  # snapshot 287
  # snapshot 560
  # snapshot 522
  # snapshot 360
  # snapshot 506
  # snapshot 303
  # snapshot 146
  # snapshot 282
  # snapshot 464
  # snapshot 60
  # snapshot 762
  # snapshot 983
  # snapshot 415
  # snapshot 10
  # snapshot 714
  # snapshot 111
  # snapshot 790
  # snapshot 462
  # snapshot 165
  # snapshot 806
  # snapshot 787
  # snapshot 689
  # snapshot 423
  # snapshot 966
  # snapshot 29
  # snapshot 444
  # snapshot 882
  # snapshot 413
  # snapshot 82
  # snapshot 221
  # snapshot 832
  # snapshot 489
  # snapshot 116
  # snapshot 521
  # snapshot 857
  # snapshot 206
  # snapshot 421
  # snapshot 739
  # snapshot 715
  # snapshot 790
  # snapshot 5
  # snapshot 985
  # snapshot 483
  # snapshot 495
  # snapshot 36
  # snapshot 816
  # snapshot 621
  # snapshot 669
  # snapshot 5
