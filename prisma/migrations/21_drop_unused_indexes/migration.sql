-- Indexen die op stats.nssense.be in vier weken nooit gebruikt zijn
-- (pg_stat_user_indexes, idx_scan = 0, 27/09 tot 23/10/2026) en samen
-- 315 van de 668 MB innamen. Het Deruddere-paneel en het dashboard vragen
-- alleen active, stats, pageviews en metrics (path, referrer, device,
-- country, event, channel), en Postgres kiest daarvoor de index op
-- (website_id, created_at). Zonder deze indexen past Umami in het gratis
-- Aiven-plan (1 GB) met 61 dagen data.
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_created_at_page_title_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_created_at_url_path_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_visit_id_created_at_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_created_at_url_query_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_created_at_event_name_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_website_id_created_at_tag_idx";
DROP INDEX CONCURRENTLY IF EXISTS "website_event_visit_id_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_os_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_screen_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_city_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_browser_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_language_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_device_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_country_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_region_idx";
DROP INDEX CONCURRENTLY IF EXISTS "session_website_id_created_at_idx";
