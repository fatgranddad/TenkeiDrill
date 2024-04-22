# データベース設計

## Users テーブル
ユーザー情報を管理します。devise を用いた認証システムを含んでいます。

| Column               | Type     | Options                         |
|----------------------|----------|---------------------------------|
| id                   | integer  | null: false, primary key        |
| email                | string   | null: false, unique: true       |
| encrypted_password   | string   | null: false                     |
| nickname             | string   | null: false                     |

### Association
- has_many :tile_sets

### 説明
- email: ユーザーのメールアドレスです。ログインに使用され、一意である必要があります。
- encrypted_password: ユーザーのパスワードが暗号化されて保存されます。
- nickname: ユーザーがアプリ内で使用する表示名です。

## Tiles テーブル
麻雀の牌を管理します。各牌は名前、種類、数値、画像情報を持ちます。

| Column    | Type     | Options                   |
|-----------|----------|---------------------------|
| id        | integer  | null: false, primary key  |
| name      | string   | null: false               |
| category  | string   | null: false               |
| value     | integer  | null: false               |

### Association
- has_many :tile_set_items

### 説明
- name: 牌の名称です（例：一萬、二筒など）。
- category: 牌の種類を示します（萬子、筒子、索子、字牌）。
- value: 牌の数値です。萬子、筒子、索子は1-9、字牌は特定の値を持ちます。
- image: 牌の画像。Active Storageを利用して管理されます。

## TileSets テーブル
アガリ形を構成する牌のセットを管理します。アガリ形の詳細と作成者情報を含みます。

| Column      | Type     | Options                        |
|-------------|----------|--------------------------------|
| id          | integer  | null: false, primary key       |
| description | text     | null: false                    |
| user_id     | integer  | null: false, foreign key       |

### Association
- belongs_to :user
- has_many :tile_set_items

### 説明
- description: アガリ形の説明または名前です。
- user_id: アガリ形を作成したユーザーのIDです。

## TileSetItems テーブル
TileSetsとTilesの関連を管理する中間テーブル。どの牌がどのアガリ形に使用されているかを定義します。

| Column     | Type     | Options                                 |
|------------|----------|-----------------------------------------|
| id         | integer  | null: false, primary key                |
| tileset_id | integer  | null: false, foreign key (references TileSets) |
| tile_id    | integer  | null: false, foreign key (references Tiles)    |
| position   | integer  | null: false                             |

### Association
- belongs_to :tile_set
- belongs_to :tile

### 説明
- position: 牌のアガリ形における位置を示します。

## HandTypes テーブル
麻雀の役を管理するテーブルです。各役は名前と翻数、説明を持ちます。

| Column      | Type     | Options                   |
|-------------|----------|---------------------------|
| id          | integer  | null: false, primary key  |
| name        | string   | null: false               |
| han         | integer  | null: false               |
| description | text     | null: false               |

### Association
- has_many :hand_results

### 説明
- name: 役の名前（例：リーチ、一発、門前清自摸和など）。
- han: 役の基本翻数。
- description: 役の詳細説明。

## HandResults テーブル
アガリ形ごとの得点計算結果を記録するテーブルです。

| Column     | Type     | Options                                        |
|------------|----------|------------------------------------------------|
| id         | integer  | null: false, primary key                       |
| tileset_id | integer  | null: false, foreign key (references TileSets) |
| handtype_id| integer  | null: false, foreign key (references HandTypes)|
| fu         | integer  | null: false                                    |
| han        | integer  | null: false                                    |
| points     | integer  | null: false                                    |

### Association
- belongs_to :tileset
- belongs_to :handtype

### 説明
- tileset_id: 対応するアガリ形のID。
- handtype_id: 適用される役のID。
- fu: 符数。
- han: 実際のプレイでの翻数（追加翻含む）。
- points: 計算された点数。