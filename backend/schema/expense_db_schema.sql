CREATE SCHEMA IF NOT EXISTS expenses;

CREATE TABLE "Users"(
    "id" UUID NOT NULL,
    "first_name" CHAR(255) NOT NULL,
    "last_name" CHAR(255) NOT NULL,
    "email" CHAR(255) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL,
    "updated_at" TIMESTAMPTZ NOT NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("id");
CREATE TABLE "Transactions"(
    "id" UUID NOT NULL,
    "group_id" UUID NOT NULL,
    "created_by" UUID NOT NULL,
    "paid_by" UUID NOT NULL,
    "description" CHAR(255) NOT NULL,
    "amount" BIGINT NOT NULL,
    "currency" CHAR(255) NOT NULL,
    "date" DATE NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL,
    "type" CHAR(255) NOT NULL
);
ALTER TABLE
    "Transactions" ADD PRIMARY KEY("id");
CREATE TABLE "TransactionSplits"(
    "transaction_id" UUID NOT NULL,
    "owed_to" UUID NOT NULL,
    "owed_by" UUID NOT NULL,
    "amount" BIGINT NOT NULL,
    "group_id" UUID NULL
);
ALTER TABLE
    "TransactionSplits" ADD PRIMARY KEY("transaction_id", "owed_to", "owed_by");
CREATE TABLE "GroupMembers"(
    "group_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "joined_at" TIMESTAMPTZ NOT NULL
);
ALTER TABLE
    "GroupMembers" ADD PRIMARY KEY("group_id", "user_id");
CREATE TABLE "Groups"(
    "id" UUID NOT NULL,
    "name" CHAR(255) NOT NULL,
    "created_by" UUID NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL
);
ALTER TABLE
    "Groups" ADD PRIMARY KEY("id");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "Users"("id");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Groups"("id");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_paid_by_foreign" FOREIGN KEY("paid_by") REFERENCES "Users"("id");
ALTER TABLE
    "TransactionSplits" ADD CONSTRAINT "transactionsplits_transaction_id_foreign" FOREIGN KEY("transaction_id") REFERENCES "Transactions"("id");
ALTER TABLE
    "TransactionSplits" ADD CONSTRAINT "transactionsplits_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Groups"("id");
ALTER TABLE
    "GroupMembers" ADD CONSTRAINT "groupmembers_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("id");
ALTER TABLE
    "GroupMembers" ADD CONSTRAINT "groupmembers_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Groups"("id");