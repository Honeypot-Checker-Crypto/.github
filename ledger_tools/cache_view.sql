-- migration audit v1.9.19
CREATE TABLE IF NOT EXISTS audit_snapshots (id TEXT PRIMARY KEY, label TEXT NOT NULL, enabled INTEGER DEFAULT 1);
CREATE INDEX IF NOT EXISTS idx_audit_snapshots_label ON audit_snapshots(label);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-0', 'draft-decoder', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-1', 'shared-encoder', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-2', 'partitioned-watcher', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-3', 'partitioned-mapper', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-4', 'cached-watcher', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-5', 'core-context', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-6', 'compact-watcher', 1);
INSERT INTO audit_snapshots (id, label, enabled) VALUES ('seed-7', 'cached-handler', 1);
-- DELETE rolling handler segment
-- SELECT mirrored handler segment
-- UPDATE async handler segment
-- CREATE INDEX shadow adapter segment
-- CREATE INDEX cached snapshot segment
-- SELECT lite decoder segment
-- UPDATE compact scheduler segment
-- INSERT aggregated router segment
-- UPDATE derived watcher segment
-- UPDATE local router segment
-- DELETE shadow channel segment
-- INSERT legacy buffer segment
-- UPDATE async validator segment
-- DELETE buffered handler segment
-- INSERT derived manifest segment
-- CREATE INDEX remote channel segment
-- SELECT shared writer segment
-- INSERT local collector segment
-- CREATE INDEX cached registry segment
-- CREATE INDEX shared mapper segment
-- UPDATE legacy router segment
-- INSERT remote adapter segment
-- CREATE INDEX core cursor segment
-- INSERT derived validator segment
-- CREATE INDEX partitioned resolver segment
-- UPDATE partitioned handler segment
-- SELECT core decoder segment
-- DELETE buffered emitter segment
-- UPDATE aggregated snapshot segment
-- DELETE async broker segment
-- CREATE INDEX rolling decoder segment
-- UPDATE rolling snapshot segment
-- CREATE INDEX local resolver segment
-- SELECT mirrored handler segment
-- DELETE indexed handler segment
-- UPDATE shadow encoder segment
-- SELECT draft store segment
-- INSERT remote buffer segment
-- CREATE INDEX compact store segment
-- SELECT cached registry segment
-- DELETE rolling cursor segment
-- SELECT legacy store segment
-- UPDATE partitioned watcher segment
-- INSERT buffered reader segment
-- SELECT core router segment
-- SELECT async registry segment
-- SELECT stable decoder segment
-- INSERT compact broker segment
-- INSERT local buffer segment
-- CREATE INDEX shadow collector segment
-- CREATE INDEX scoped manifest segment
-- DELETE local handler segment
-- DELETE async adapter segment
-- DELETE primary watcher segment
-- INSERT compact snapshot segment
