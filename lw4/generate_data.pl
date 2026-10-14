#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use open qw(:std :utf8);


my $output_file = 'mock_data.sql';
open(my $fh, '>', $output_file) or die "Cannot open $output_file: $!\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Моковые данные для Лабораторной работы №4\n";
print $fh "-- Сгенерировано автоматически\n";
print $fh "-- ==========================================================================\n\n";

print $fh "SET search_path TO public;\n\n";

print $fh "-- Очистка таблиц\n";
print $fh "DELETE FROM stock;\n";
print $fh "DELETE FROM medicine;\n";
print $fh "DELETE FROM pharmacy;\n";
print $fh "DELETE FROM category;\n";
print $fh "DELETE FROM manufacturer;\n\n";

print $fh "-- Сброс счётчиков\n";
print $fh "ALTER SEQUENCE manufacturer_id_seq RESTART WITH 1;\n";
print $fh "ALTER SEQUENCE category_id_seq RESTART WITH 1;\n";
print $fh "ALTER SEQUENCE medicine_id_seq RESTART WITH 1;\n";
print $fh "ALTER SEQUENCE pharmacy_id_seq RESTART WITH 1;\n";
print $fh "ALTER SEQUENCE stock_id_seq RESTART WITH 1;\n\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Производители\n";
print $fh "-- ==========================================================================\n";

my @manufacturers = (
    ["ФармаТек",       "Россия",      "+74951234567", "LIC-001"],
    ["Байер",          "Германия",    "+49215123456", "LIC-002"],
    ["Пфайзер",        "США",         "+12123456789", "LIC-003"],
    ["Акрихин",        "Россия",      "+74959876543", "LIC-004"],
    ["Новартис",       "Швейцария",   "+41442345678", "LIC-005"],
    ["Фармстандарт",   "Россия",      "+74951112233", "LIC-006"],
    ["Сандоз",         "Австрия",     "+43123456789", "LIC-007"],
    ["Тева",           "Израиль",     "+97232345678", "LIC-008"],
);

for my $m (@manufacturers) {
    my ($name, $country, $phone, $lic) = @$m;
    print $fh "INSERT INTO manufacturer (name, country, phone, license_number) VALUES ('$name', '$country', '$phone', '$lic');\n";
}
print $fh "\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Категории\n";
print $fh "-- ==========================================================================\n";

my @categories = (
    ["Обезболивающие",     "Средства для снятия боли",                    0.10, "TRUE"],
    ["Жаропонижающие",     "Снижение температуры",                        0.10, "TRUE"],
    ["Антибиотики",        "Противомикробные средства",                   0.20, "TRUE"],   # tax > 15%
    ["Витамины",           "Витаминные комплексы",                        0.05, "TRUE"],
    ["Сердечно-сосудистые","Для лечения сердечно-сосудистых заболеваний", 0.15, "TRUE"],
    ["ЖКТ",                "Для желудочно-кишечного тракта",              0.18, "TRUE"],   # tax > 15%
    ["Респираторные",      "От простуды и кашля",                         0.12, "TRUE"],
    ["Успокоительные",     "Седативные средства",                         0.25, "TRUE"],   # tax > 15%
);

for my $c (@categories) {
    my ($name, $desc, $tax, $active) = @$c;
    print $fh "INSERT INTO category (name, description, tax_rate, is_active) VALUES ('$name', '$desc', $tax, $active);\n";
}
print $fh "\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Лекарства\n";
print $fh "-- ==========================================================================\n";


my @medicines = (
    # Категория 1 - Обезболивающие
    ["Аспирин",              "Таблетки",  "TRUE",   85.00,   1, 1],
    ["Ибупрофен",            "Таблетки",  "FALSE",  150.00,  1, 1],
    ["Анальгин",             "Таблетки",  "FALSE",  95.00,   4, 1],
    ["Кеторол",              "Ампулы",    "TRUE",   320.00,  2, 1],
    
    # Категория 2 - Жаропонижающие
    ["Парацетамол",          "Таблетки",  "FALSE",  60.00,   1, 2],
    ["Нурофен",              "Таблетки",  "FALSE",  280.00,  3, 2],
    ["Эффералган",           "Шипучие",   "FALSE",  220.00,  5, 2],
    ["Панадол",              "Таблетки",  "FALSE",  180.00,  3, 2],
    ["Терафлю",              "Порошок",   "FALSE",  450.00,  6, 2],
    ["Колдрекс",             "Порошок",   "FALSE",  380.00,  6, 2],
    
    # Категория 3 - Антибиотики
    ["Аугментин",            "Таблетки",  "TRUE",   520.00,  5, 3],
    ["Сумамед",              "Капсулы",   "TRUE",   680.00,  8, 3],
    ["Флемоксин",            "Таблетки",  "TRUE",   420.00,  2, 3],
    ["Ципролет",             "Таблетки",  "TRUE",   310.00,  8, 3],
    ["Доксициклин",          "Капсулы",   "TRUE",   180.00,  4, 3],
    ["Кларитромицин",        "Таблетки",  "TRUE",   490.00,  5, 3],
    
    # Категория 4 Витамины
    ["Витамин C",            "Таблетки",  "FALSE",  120.00,  1, 4],
    ["Витамин D",            "Капли",     "FALSE",  380.00,  3, 4],
    ["Компливит",            "Таблетки",  "FALSE",  290.00,  6, 4],
    ["Супрадин",             "Шипучие",   "FALSE",  650.00,  5, 4],
    
    # Категория 5 Сердечно-сосудистые
    ["Валокордин",           "Капли",     "FALSE",  210.00,  4, 5],
    ["Корвалол",             "Капли",     "FALSE",  95.00,   4, 5],
    ["Нитроглицерин",        "Таблетки",  "TRUE",   150.00,  2, 5],
    ["Анаприлин",            "Таблетки",  "TRUE",   80.00,   4, 5],
    
    # Категория 6 ЖКТ
    ["Омез",                 "Капсулы",   "FALSE",  280.00,  8, 6],
    ["Смекта",               "Порошок",   "FALSE",  190.00,  5, 6],
    ["Мезим",                "Таблетки",  "FALSE",  240.00,  2, 6],
    ["Линекс",               "Капсулы",   "FALSE",  420.00,  5, 6],
    
    # Категория 7 Респираторные
    ["АЦЦ",                  "Шипучие",   "FALSE",  350.00,  2, 7],
    ["Мукалтин",             "Таблетки",  "FALSE",  75.00,   4, 7],
    ["Лазолван",             "Сироп",     "FALSE",  280.00,  5, 7],
    ["Амбробене",            "Сироп",     "FALSE",  260.00,  2, 7],
    
    # Категория 8 Успокоительные
    ["Валериана",            "Таблетки",  "FALSE",  90.00,   4, 8],
    ["Пустырник",            "Настойка",  "FALSE",  70.00,   4, 8],
    ["Новопассит",           "Сироп",     "FALSE",  380.00,  8, 8],
);

for my $m (@medicines) {
    my ($name, $form, $recipe, $price, $manuf_id, $cat_id) = @$m;
    my $recipe_val = $recipe eq "TRUE" ? "TRUE" : "FALSE";
    print $fh "INSERT INTO medicine (name, release_form, requires_prescription, base_price, manufacturer_id, category_id) VALUES ('$name', '$form', $recipe_val, $price, $manuf_id, $cat_id);\n";
}
print $fh "\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Аптеки\n";
print $fh "-- ==========================================================================\n";

my @pharmacies = (
    ["Аптека №1",            "ул. Ленина, 10",           "+74951111111", "08:00-22:00"],
    ["Аптека №2",            "ул. Мира, 25",             "+74952222222", "Круглосуточно"],
    ["Аптека №3",            "пр. Победы, 5",            "+74953333333", "09:00-21:00"],
    ["Аптека Центральная",   "ул. Советская, 1",         "+74954444444", "08:00-23:00"],
    ["Аптека Здоровье",      "ул. Гагарина, 15",         "+74955555555", "09:00-22:00"],
    ["Аптека Вита",          "ул. Пушкина, 42",          "+74956666666", "Круглосуточно"],
    ["Аптека Горздрав",      "ул. Чехова, 7",            "+74957777777", "08:00-21:00"],
    ["Аптека Ригла",         "пр. Мира, 100",            "+74958888888", "09:00-22:00"],
);

for my $p (@pharmacies) {
    my ($name, $addr, $phone, $hours) = @$p;
    print $fh "INSERT INTO pharmacy (name, address, phone, working_hours) VALUES ('$name', '$addr', '$phone', '$hours');\n";
}
print $fh "\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Наличие на складе\n";
print $fh "-- ==========================================================================\n";


my $medicine_count = scalar @medicines;
my $pharmacy_count = scalar @pharmacies;

my $stock_id = 0;
my @dates_2023 = (
    '2023-01-15', '2023-02-20', '2023-03-10', '2023-04-05',
    '2023-05-18', '2023-06-22', '2023-07-14', '2023-08-30',
    '2023-09-11', '2023-10-15', '2023-10-15', '2023-11-03',
    '2023-11-25', '2023-12-08', '2023-12-20',
);

for my $ph_id (1 .. $pharmacy_count) {
    # Для аптеки №1 (id=1) генерируем много товаров с большим количеством
    my $items_per_pharmacy = ($ph_id == 1) ? 25 : 15;
    
    for my $i (0 .. $items_per_pharmacy - 1) {
        $stock_id++;

        my $med_id = (($ph_id * 3 + $i * 7) % $medicine_count) + 1;
        
        my $qty;
        if ($ph_id == 1) {
            $qty = 60 + ($i * 13) % 140;  # 60..199
        } else {
            $qty = 5 + ($i * 7 + $ph_id * 3) % 80;  # 5..84
        }
        
        my $date = $dates_2023[($stock_id - 1) % scalar @dates_2023];
        
        my $base_price = $medicines[$med_id - 1]->[3];
        my $local_price = sprintf("%.2f", $base_price * (1 + (($stock_id % 20) - 10) / 100));
        
        my $batch = sprintf("B%04d-%02d", $med_id, $ph_id);
        
        print $fh "INSERT INTO stock (pharmacy_id, medicine_id, quantity, arrival_date, local_price, batch_number) VALUES ($ph_id, $med_id, $qty, '$date', $local_price, '$batch');\n";
    }
}
print $fh "\n";

print $fh "-- ==========================================================================\n";
print $fh "-- Проверка количества записей\n";
print $fh "-- ==========================================================================\n";
print $fh "SELECT 'manufacturers' AS table_name, COUNT(*) AS cnt FROM manufacturer\n";
print $fh "UNION ALL SELECT 'categories', COUNT(*) FROM category\n";
print $fh "UNION ALL SELECT 'medicines', COUNT(*) FROM medicine\n";
print $fh "UNION ALL SELECT 'pharmacies', COUNT(*) FROM pharmacy\n";
print $fh "UNION ALL SELECT 'stock', COUNT(*) FROM stock;\n";

close $fh;

print "Данные сгенерированы в файл: $output_file\n";
print "Статистика:\n";
printf "   - Производителей: %d\n", scalar @manufacturers;
printf "   - Категорий: %d\n", scalar @categories;
printf "   - Лекарств: %d\n", scalar @medicines;
printf "   - Аптек: %d\n", scalar @pharmacies;
printf "   - Записей stock: %d\n", $stock_id;

