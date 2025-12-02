echo "⏳ Waiting for Cassandra to be ready..."

while ! cqlsh cassandra 9042 -e 'describe cluster' > /dev/null 2>&1; do
  echo "   Cassandra is unavailable - sleeping..."
  sleep 5
done

echo "✅ Cassandra is UP! Executing schema script..."

cqlsh cassandra 9042 -f /schema.cql

echo "🎉 Schema initialized successfully!"