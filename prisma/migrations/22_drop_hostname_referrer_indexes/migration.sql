-- Stap 2 na migratie 21: de twee indexen op website_event die op
-- stats.nssense.be sinds de verhuis van 27/09/2026 nauwelijks gebruikt zijn
-- (pg_stat_user_indexes op 29/10/2026: hostname 57 keer, referrer_domain
-- 3 keer, tegenover 18.498 keer voor created_at) en samen 118 van de 398 MB
-- innamen. Vragen per hostnaam en per verwijzende site lopen over de index
-- (website_id, created_at), zoals alle andere metrics. Zo blijft Umami met
-- 61 dagen data ruim in het gratis Aiven-plan, ook bij het dubbele verkeer.
-- Geen CONCURRENTLY: Prisma draait een migratie in een transactie. In
-- productie zijn ze vooraf met psql (CONCURRENTLY) verwijderd; hier IF EXISTS.
DROP INDEX IF EXISTS "website_event_website_id_created_at_hostname_idx";
DROP INDEX IF EXISTS "website_event_website_id_created_at_referrer_domain_idx";
