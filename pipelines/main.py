import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
import argparse

def run():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input_topic', required=True)
    parser.add_argument('--output_path', required=True)
    args, beam_args = parser.parse_known_args()

    options = PipelineOptions(beam_args, streaming=True, save_main_session=True)
    
    with beam.Pipeline(options=options) as p:
        (p | "Read" >> beam.io.ReadFromPubSub(topic=args.input_topic)
           | "Transform" >> beam.Map(lambda x: x.decode('utf-8').upper())
           | "Write" >> beam.io.WriteToText(args.output_path))

if __name__ == "__main__":
    run()